'use strict'
fs = require 'fs'
should = require 'should'

require './TestUtils'
ZoxelIO = require '../coffee/Zoxel.io'

describe 'ZoxelIO', ->
  model = chr_knight = null
  before (done) ->
    model = require './models/chr_knight.json'
    fs.readFile 'test/models/chr_knight.zox', 'utf8', (err, data) ->
      return done(err) if err?
      chr_knight = data
      done()
  describe 'import', ->
    it 'should be able to successfully import a .zox file', ->
      io = new ZoxelIO chr_knight
      io.should.have.ownProperty('x', 'expected io.x to be defined').equal(20, 'expected io.x to be 20')
      io.should.have.ownProperty('y', 'expected io.y to be defined').equal(20, 'expected io.y to be 20')
      io.should.have.ownProperty('z', 'expected io.z to be defined').equal(21, 'expected io.z to be 21')
      io.should.have.ownProperty('voxels', 'expected io.voxels to be defined')
      JSON.parse(JSON.stringify(io.voxels)).should.eql(model.voxels)
  describe 'export', ->
    io = null
    before ->
      io = new ZoxelIO model
    it 'should be able to successfully export to a .zox file', ->
      io.export().should.eql(chr_knight)
