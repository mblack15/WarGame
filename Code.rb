cards = [2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,10,11,11,11,11,12,12,12,12,13,13,13,13,14,14,14,14]
cards = cards.shuffle
count = 0
cards_p1 = cards[0..25]
cards_p2 = cards[26..51]
card_count_nd_p1= 0 # Cards in the new deck
card_count_nd_p2= 0
deck2_cards_p1= Array.new # The second deck
deck2_cards_p1= Array.new
switchy = Array.new
total_cards_p1 = cards_p1.length
total_cards_p2 = cards_p2.length
while(total_cards_p1 != 0 and total_cards_p2 != 0) # One player has no cards, game is over'
	while(cards_p1.length != count or cards_p2.length != count) # One player has no cards left in their deck
		if cards_p1[count] > cards_p2[count] # If P1's card is bigger
			deck2_cards_p1.push(cards_p1[count]) # P1 Keeps their card
			deck2_cards_p1.push(cards_p2[count]) # P1 Gets P2's cards
			card_count_nd_p1 += 2
			total_cards_p1 += 1
			total_cards_p2 -= 1
		elsif cards_p1[count] < cards_p2[count] # If P2's card is bigger
			deck2_cards_p2.push(cards_p1[count])
			deck2_cards_p2.push(cards_p2[count])
			card_count_nd_p2 += 2
			total_cards_p2 += 1
			total_cards_p1 -= 1
		else # Need to add something if one of the plays does not have an additonal 3 cards
			if (cards_p1.length - count) <= 3 || (cards_p1.length - count) <= 3
				if (cards_p1.length - count) >= 1 or (cards_p1.length - count) >= 1
					if cards_p1[count + 1] < cards_p2[count + 1] # There are less than 3 cards left in the deck
						2.times do
							deck2_cards_p1.push(cards_p1[count])
							deck2_cards_p1.push(cards_p2[count])
							card_count_nd_p1 += 2
							total_cards_p1 += 1
							total_cards_p2 -= 1
							count += 1
						end
						count -= 1
					elsif cards_p1[count + 1] < cards_p1[count + 1]
						2.times do
							deck2_cards_p2.push(cards_p1[count])
							deck2_cards_p2.push(cards_p2[count])
							card_count_nd_p2 += 2
							count += 1
							total_cards_p1 += 1
							total_cards_p2 -= 1
						end
						count -= 1
					end
				else
					deck2_cards_p1.push(cards_p1[count])
					deck2_cards_p2.push(cards_p2[count])
				end
			elsif cards_p1[count + 3] > cards_p1[count + 3] # If there is a tie
				4.times do
					deck2_cards_p1.push(cards_p1[count])
					deck2_cards_p1.push(cards_p2[count])
					card_count_nd_p1 += 2
					total_cards_p1 += 1
					total_cards_p2 -= 1
					count += 1
				end
				count -= 1
			elsif cards_p1[count + 3] < cards_p1[count + 3]
				4.times do
					deck2_cards_p2.push(cards_p1[count])
					deck2_cards_p2.push(cards_p2[count])
					card_count_nd_p2 += 2
					count += 1
					total_cards_p1 += 1
					total_cards_p2 -= 1
				count -= 1
			else
				deck2_cards_p1.push(cards_p1[count])
				deck2_cards_p2.push(cards_p2[count])
			end
		end
		count += 1 # Changing the count for next round
	end
	if cards_p1.length == count  # Assigns a new deck if P1's deck runs out of cards
		p2_cards = p2_cards.drop(count)
		p2_cards = p2_cards + deck2_cards_p2
		deck2_cards_p2 = switchy
		p1_cards = deck2_cards_p1
		deck2_cards_p1 = switchy
	elsif cards_p2.length == count
		p1_cards = p1_cards.drop(count)
		p1_cards = p1_cards + deck2_cards_p1
		deck2_cards_p1 = switchy
		p2_cards = deck2_cards_p2
		deck2_cards_p2 = switchy
	end
	count = 0
end
