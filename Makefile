.RECIPEPREFIX+= 

FLAGS=-M../dale-extensions -M../dale-gl



all: game

game: libspatial.dtm src/game.dt
  dalec src/game.dt -lGL -lglut -o game $(FLAGS)

libspatial.dtm: src/spatial.dt
  dalec -c src/spatial.dt $(FLAGS)

src/%.dt:
  true

.PHONY: all clean
clean:
  rm -f game && rm *.so && rm *.bc && rm *.dtm && rm src/*.o

