drawFig <- function(p1, p2, p3, p4) {
  
  lines(
    x = c(p2[1], p1[1]),
    y = c(p2[2], p1[2]),
    type = 'l',
    lwd = 3,
    col = 'blue'
  )
  
  lines(
    x = c(p1[1], p4[1]),
    y = c(p1[2], p4[2]),
    type = 'l',
    lwd = 3,
    col = 'red'
  )
  
  lines(
    x = c(p4[1], p3[1]),
    y = c(p4[2], p3[2]),
    type = 'l',
    lwd = 3,
    col = 'green'
  )
}

drawPic <- function(p1, p2, p3, p4,
                    xmin = -50, xmax = 50, 
                    ymin = -50, ymax = 50,
                    dUp = 0,
                    moveUp = 0, 
                    moveL = 0,
                    mirDn = F,
                    mirR = F,
                    diag = 1,
                    size = F) {
  
  p2[2] <- p2[2] + dUp
  p4[2] <- p4[2] + dUp
  
  p1[2] <- p1[2] + moveUp
  p2[2] <- p2[2] + moveUp
  p3[2] <- p3[2] + moveUp
  p4[2] <- p4[2] + moveUp

  p1[1] <- p1[1] + moveL
  p2[1] <- p2[1] + moveL
  p3[1] <- p3[1] + moveL
  p4[1] <- p4[1] + moveL
  
  plot (
    x = 0,
    y = 0,
    xlim = c(xmin, xmax),
    ylim = c(ymin, ymax),
    type = 'n',
    xlab = '',
    ylab = '',
    fg = 'gray',
    main = 'Буква И'
  )
  
  abline(v = seq(from = xmin, to = xmax, by = (xmax-xmin)/10),
         h = seq(from = ymin, to = ymax, by = (ymax-ymin)/10),
         col = 'gray', lty = 2, lwd =1)
  
  abline(v = 0, h = 0, col = 'purple', lty = 1, lwd = 1.5)
  
  if (size) {
    
    raznica1 <- abs(p2[2]-p1[2])/2
    raznica2 <- abs(p4[2]-p3[2])/2
    raznica3 <- abs(p1[1]-p4[1])/4

    p2[2] <- p2[2] - raznica1
    
    p1[1] <- p1[1] + raznica3
    p4[1] <- p4[1] - raznica3
    
    p2[1] <- p1[1]
    p3[1] <- p4[1]
    
    p4[2] <- p2[2]
    
  }
  
  if (mirDn) {
    p1[2] <- p1[2] * (-1)
    p2[2] <- p2[2] * (-1)
    p3[2] <- p3[2] * (-1)
    p4[2] <- p4[2] * (-1)
  }
  
  if (mirR) {
    p1[1] <- p1[1] * (-1)
    p2[1] <- p2[1] * (-1)
    p3[1] <- p3[1] * (-1)
    p4[1] <- p4[1] * (-1)
  }
  
  t <- 0
  m = abs(p1[1] - p3[1])
  
  while (t < diag) {
    drawFig(p1, p2, p3, p4)
    p1[1] <- p1[1] - m

    p2[1] <- p2[1] - m

    p3[1] <- p3[1] - m

    p4[1] <- p4[1] - m
    
    t <- t + 1
  }
}

{
  p1 <- c(10, 20)
  p2 <- c(10, 70)
  p3 <- c(40, 20)
  p4 <- c(40, 70)
  
  xmin <- -50
  xmax <- 200
  ymin <- -50
  ymax <- 400
  
  drawPic(
    p1 = p1,
    p2 = p2,
    p3 = p3,
    p4 = p4
  )
}