class Cell {
  float cellJiggleX;
  float cellJiggleY;

  Cell() {
    cellJiggleX = 0;
    cellJiggleY= 0;
  }

  Cell(float x, float y) {
    cellJiggleX = x;
    cellJiggleY = y;
  }

  void paint() {
    cellJiggleX = (sin(radians(millis() * cellJiggleSpeed )) * cellJiggleStrength) + cellCoordinateX;
    cellJiggleY= (sin(radians(millis() * cellJiggleSpeed )) * cellJiggleStrength) + cellCoordinateY;

    pushMatrix();
    translate(width / 2, height / 2);
    pushStyle();
    stroke(cellBorderR, cellBorderG, cellBorderB, cellBorderA);
    fill(cellColorR, cellColorG, cellColorB, cellColorA);
    ellipse(cellJiggleX, cellJiggleY, cellSizeX, cellSizeY);
    popStyle();
    popMatrix();
  }

  void chromaticAberrationRed() {
    pushMatrix();
    translate(width / 2, height / 2);
    pushStyle();
    noStroke();
    fill(255, 0, 0, chromaticFillA);
    ellipse(cellJiggleX*chromaticOffsetR, cellJiggleY*chromaticOffsetR, cellSizeX*chromaticSizeR, cellSizeY*chromaticSizeR);
    popStyle();
    popMatrix();
  }

  void chromaticAberrationBlue() {
    pushMatrix();
    translate(width / 2, height / 2);
    pushStyle();
    noStroke();
    fill(0, 0, 255, chromaticFillA);
    ellipse(cellJiggleX*chromaticOffsetB, cellJiggleY*chromaticOffsetB, cellSizeX*chromaticSizeB, cellSizeY*chromaticSizeB);
    popStyle();
    popMatrix();
  }
}
