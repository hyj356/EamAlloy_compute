FC = gfortran						# 编译器名字
TARGET = target					# 可执行程序的名字
FFLAGS = -O3 -fopenmp		# 执行3级优化, 开启openMP并行
OBJS = global_var.o mod_fileIO.o mod_computePE.o main.o

${TARGET}: ${OBJS}
	${FC} $^ -o $@ ${FFLAGS}	

%.o: %.f90
	${FC} -c ${FFLAGS} $< -o $@

.PHONY: clean

clean:
	rm -rf *.mod *.o ${TARGET}