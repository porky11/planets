prefix=/usr/local
bindir=$(prefix)/bin


all: game

game: libglut.dtm libgl.dtm libspatial.dtm libutil.dtm src/game.dt
	dalec src/game.dt -lGL -lglut -o game

libgl.dtm: src/gl.dt libutil.dtm
	dalec -c src/gl.dt

libglut.dtm: src/glut.dt
	dalec -c src/glut.dt

libspatial.dtm: src/spatial.dt
	dalec -c src/spatial.dt

libutil.dtm: src/util.dt
	dalec -c src/util.dt

src/game.dt:
	true

src/gl.dt:
	true

src/glut.dt:
	true

src/spatial.dt:
	true

src/util.dt:
	true


clean:
	rm -f game && rm *.so && rm *.bc && rm *.dtm

install:
	install game $(bindir)/game -m 755

