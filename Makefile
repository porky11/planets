prefix=/usr/local
bindir=$(prefix)/bin


all: game

game: libglut.dtm libgl.dtm src/game.dt
	dalec src/game.dt -lGL -lglut -o game

libgl.dtm: src/gl.dt
	dalec -c src/gl.dt

libglut.dtm: src/glut.dt
	dalec -c src/glut.dt

src/game.dt:
	true

src/gl.dt:
	true

src/glut.dt:
	true


clean:
	rm -f game && rm *.so && rm *.bc && rm *.dtm

install:
	install game $(bindir)/game -m 755

