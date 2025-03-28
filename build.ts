import { type Build } from 'xbuild';

const build: Build = {
    common: {
        project: 'fastnoiselite',
        archs: ['x64'],
        variables: [],
        copy: {
            'FastNoiseLite/C/FastNoiseLite.h': '../C/FastNoiseLite.c'
        },
        defines: ['FNL_IMPL'],
        options: [],
        subdirectories: [],
        libraries: {
            fastnoiselite: {
                sources: ['FastNoiseLite/C/FastNoiseLite.c']
            },
        },
        buildDir: 'build',
        buildOutDir: 'libs',
        buildFlags: []
    },
    platforms: {
        win32: {
            windows: {},
            android: {
                archs: ['x86', 'x86_64', 'armeabi-v7a', 'arm64-v8a'],
            }
        },
        linux: {
            linux: {}
        },
        darwin: {
            macos: {}
        }
    }
}

export default build;