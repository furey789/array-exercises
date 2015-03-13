require 'spec_helper'

describe "Tic Tac Toe, in arrays" do
  let(:___) { nil }

  let(:data) {
    [
      ['X', 'O', 'O'],
      ['X', 'X', 'O'],
      ['O', 'X', 'O']
    ]
  }

  describe "counting usage per row" do
    it "returns how many times X was played in each row" do
      #xs_per_row = [ data[0].count('X'), data[1].count('X'), data[2].count('X')]
      xs_per_row=[]
      data.map{ |r| xs_per_row << r.count('X') }
      expect(xs_per_row).to be == [1, 2, 1]
    end

    it "returns how many times O was played in each row" do
      os_per_row = [ data[0].count('O'), data[1].count('O'), data[2].count('O')]
      expect(os_per_row).to be == [2, 1, 2]
    end
  end

  # STOPPED HERE

  describe "getting coordinates of usage" do
    it "returns an array of [row, column] array coordinates for each usage of X" do
      x_coordinates=[]
      data.each_index do |r|
        data[r].each_index do |c|
          if data[r][c]=='X'
            x_coordinates << [r,c]
          end
        end
      end
      expect(x_coordinates).to be == [[0, 0], [1, 0], [1, 1], [2, 1]]
    end

    it "returns an array of [row, column] array coordinates for each usage of O" do
      o_coordinates=[]
      data.each_index do |r|
        data[r].each_index do |c|
          if data[r][c]=='O'
            o_coordinates << [r,c]
          end
        end
      end
      expect(o_coordinates).to be == [[0, 1], [0, 2], [1, 2], [2, 0], [2, 2]]
    end
  end

  describe "testing who won" do
    it "determines whether X or O won" do

      x_coords= [[0, 0], [1, 0], [1, 1], [2, 1]]
      o_coords= [[0, 1], [0, 2], [1, 2], [2, 0], [2, 2]]

      wx=[]
      num_x_in_rows=[]
      x_coords.map { |c| num_x_in_rows << c[0] }
      (0..2).map{ |id| wx<<num_x_in_rows.count(id)}
      num_x_in_cols=[]
      x_coords.map { |c| num_x_in_cols << c[1] }
      (0..2).map{ |id| wx<<num_x_in_cols.count(id)}

      num_xy_downdiag=0
      num_xy_updiag=0
      x_coords.each do |c|
        if c==[0,0] || c==[1,1] || c==[2,2]
          num_xy_downdiag+=1
        end
        if c==[2,0] || c==[1,1] || c==[0,2]
          num_xy_updiag+=1
        end
      end
      wx << num_xy_downdiag
      wx << num_xy_updiag

      wo=[]
      num_o_in_rows=[]
      o_coords.map { |c| num_o_in_rows << c[0] }
      (0..2).map{ |id| wo<<num_o_in_rows.count(id)}
      num_o_in_cols=[]
      o_coords.map { |c| num_o_in_cols << c[1] }
      (0..2).map{ |id| wo<<num_o_in_cols.count(id)}

      num_xy_downdiag=0
      num_xy_updiag=0
      o_coords.each do |c|
        if c==[0,0] || c==[1,1] || c==[2,2]
          num_xy_downdiag+=1
        end
        if c==[2,0] || c==[1,1] || c==[0,2]
          num_xy_updiag+=1
        end
      end
      wo << num_xy_downdiag
      wo << num_xy_updiag

      if wx.count(3)==1
        winner='X'
      elsif wo.count(3)==1
        winner = 'O'
      else
        winner = 'None'
      end

      expect(winner).to be == 'O'

    end
  end
end
