.RECIPEPREFIX+= 

all: game

game: libglut.dtm libgl.dtm libspatial.dtm libutil.dtm libsequence-math.dtm src/game.dt
  dalec src/game.dt -lGL -lglut -o game

libgl.dtm: src/gl.dt libutil.dtm
  dalec -c src/gl.dt

libglut.dtm: src/glut.dt
  dalec -c src/glut.dt

libspatial.dtm: src/spatial.dt
  dalec -c src/spatial.dt

libutil.dtm: src/util.dt
  dalec -c src/util.dt

libsequence-math.dtm: src/sequence-math.dt
  dalec -c src/sequence-math.dt

src/%.dt:
  true

.PHONY: all clean
clean:
  rm -f game && rm *.so && rm *.bc && rm *.dtm

