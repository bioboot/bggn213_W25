#' Quick interactive PDB viewing using r3dmol
#'
#' Generate a quick webGL structure overview of `pdb` objects 
#'  with a number of simple defaults. The returned r3dmol object can 
#'  be further added to for custom interactive visualizations.
#'  
#'  The purpose of this function is to quickly view a given PDB
#'  structure object without having to write multiple lines of r3dmol code. 
#'  ***Still ToDo**: Add an extra argument e.g. `highlight=NULL` that could take 
#'  an `atom.select()` object to highlight atoms as spacefill, for example. 
#'  Currently the function does not check for bio3d or r3dmol availability.
#' 
#' @param pdb PDB structure object as obtained from `read.pdb()`.
#' @param ligand logical, if TRUE ligands will be rendered as atom colored ball-and-stick.
#' @param chain.colors optional color vector for chain based protein cartoon colors. By default `vmd.colors()` are used.
#' @param backgroundColor set the display area background color. The default is black but any color, including white, and be set.
#'
#' @return an **r3dmol** display object that can be further added to or displayed using `r3dmoll::m_set_style()` and friends.
#' 
#' @author Barry Grant, \email{bjgrant@@ucsd.edu}
#' 
#' @seealso \code{r3dmol::m_glimpse()}, \code{bio3d::read.pdb()}
#'
#' @examples
#'  pdb <- read.pdb("1hsg")
#'  view.pdb(pdb)
#'  view.pdb(pdb, ligand=FALSE, chain.colors=c("pink","aquamarine"))
#'  
#'  #pdb <- read.pdb("5p21")
#'  #view.pdb(pdb)  
view.pdb <- function(pdb, ligand=TRUE,
                     chain.colors=vmd_colors(),
                     backgroundColor = "black") {
  
  # Show a quick protein cartoon with ligands as ball-and-
  # stick. By default the protein cartoon will be rainbow 
  # colored if there is only one chain. Otherwise it will 
  # colored by chain using vmd.colors() vector, if there 
  # are multiple chains detected. 
  # Optionally Show ligand as ball and stick
  #
  # view.pdb(pdb, chain.colors = c("pink","yellow"))
  
  
  # Find ligand resid/resn
  lig <- atom.select(pdb, "ligand", value=T)
  lig.resid <- unique(lig$atom$resid)
  
  # Do we have multiple chains
  chains <- unique(pdb$atom$chain)
  multi.chain <- length( chains ) > 1
  #chain.colors <- vmd_colors()
  
  # Build up the r3dmol display object
  model <- r3dmol::r3dmol(backgroundColor=backgroundColor) |>
    r3dmol::m_add_model(data = r3dmol::m_bio3d(pdb)) |>
    r3dmol::m_zoom_to()
  
  # Add protein cartoon
  if(!multi.chain) {
    # Color N-C term spectrum
    model <- model |> 
      r3dmol::m_set_style(
        style = r3dmol::m_style_cartoon(
          color = "spectrum")
      )
  } else {
    # Color by chain using the vmd.colors()
    for(i in 1:length(chains)) {
      model <- model |> 
        r3dmol::m_set_style(
          sel = r3dmol::m_sel(chain = chains[i]),
          style = r3dmol::m_style_cartoon(
            color = as.vector(chain.colors[i]) )
        ) 
    }
  } # end else
  
  # Add ligand as ball-and-stick
  if(ligand) {
    model <- model |>
      r3dmol::m_set_style(
        sel = r3dmol::m_sel(resn = lig.resid),
        style = r3dmol::m_style_stick()
      )
  } else {
    if(!is.null(lig.resid)) {
      message("Ligands found but not displayed, use ligand=T")
    }
  }
  
  return(model)
}
