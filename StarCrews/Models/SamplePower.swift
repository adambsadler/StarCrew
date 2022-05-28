//
//  SamplePower.swift
//  StarCrews
//
//  Created by Adam Sadler on 5/27/22.
//

import Foundation

struct SamplePower: Hashable {
    var name: String
    var category: String
    var notes: String
    var activation: Int64
    var strain: Int64
}

extension SamplePower {
    static let preMade: [SamplePower] =
    [
        SamplePower(name: "Adrenaline Surge", category: "Self Only", notes: "This figure immediately gains an addition action during this activation, and an additional action in their next activation as well.", activation: 12, strain: 2),
        SamplePower(name: "Antigravity Projection", category: "Line of Sight", notes: "The target figure gains the Levitate attribute (page 156) for the rest of the game.", activation: 10, strain: 0),
        SamplePower(name: "Armour Plates", category: "Self Only or Out of Game (B)", notes: "The figure gains +2 Armour. This power may not be used if the figure is already wearing combat armour. This power can be used Out of Game (B), in which case the activating figure starts the game at -2 Damage to represent the Strain.", activation: 10, strain: 2),
        SamplePower(name: "Armoury", category: "Out of Game (B)", notes: "The crew can field one suit of combat armour without having to pay its normal upkeep cost. Alternatively, one standard (not Advanced Technology) pistol, carbine, or shotgun may be given a +1 Damage modifier for the next game only.", activation: 10, strain: 0),
        SamplePower(name: "Bait and Switch", category: "Line of Sight", notes: "This power may only be used against a soldier carrying a loot token. That figure must make an immediate Will Roll (TN14). If failed, the figure immediately drops the look token and the activator may move it up to 4\" in any direction", activation: 12, strain: 2),
        SamplePower(name: "Break Lock", category: "Line of Sight", notes: "Immediately unlocks one physical-loot counter.", activation: 12, strain: 1),
        SamplePower(name: "Bribe", category: "Out of Game (B)", notes: "If successful, place one bribe token next to the table and make your opponent aware of it. At any point of the game, when your opponent declares that a soldier (not a captain or first mate) is making a Shotting attack, but before the dice are rolled, you may play your bribe token. The Shooting attack automatically misses, and no dice are rolled. No crew may use more than one bribe token in any game.", activation: 14, strain: 0),
        SamplePower(name: "Camouflage", category: "Self Only", notes: "No figure may draw line of sight to this figure if it is more than 12\" away. In addition, it games +2 Fight when rolling against Shooting attacks from pistol, carbine, shotgun, or rapid-fire attacks. This power is cancelled if the figure becomes stunned.", activation: 10, strain: 2),
        SamplePower(name: "Cancel Power", category: "Line of Sight", notes: "Immediately cancels the effects of one ongoing Line of Sight power. It has no effect on powers with other designations.", activation: 12, strain: 1),
        SamplePower(name: "Command", category: "Line of Sight", notes: "Select one member of the crew that is in line of sight. That figure now activates in the current player's phase this turn. This power may not be used on a figure that has already activated this turn.", activation: 10, strain: 0),
        SamplePower(name: "Concealed Firearm", category: "Self Only", notes: "This power may only be used while a figure is in combat. The figure may make one +5 Shooting attack against any other figure in the combat. Do not randomize the target of the attack, even if there are multiple figures in the combat. If this attack damages the target, it is automatically pushed back 1\" and stunned, even if the attack did less than 4 Damage.", activation: 10, strain: 1),
        SamplePower(name: "Control Animal", category: "Line of Sight", notes: "This power may only be used against uncontrolled animals. The target animal must make an immediate Will Roll (TN16) or become a temporary member of the same crew as the activator. Each figure with this power may only have one animal under control at any time. They may cancel this power at any time as a free action.", activation: 10, strain: 1),
        SamplePower(name: "Control Robot", category: "Line of Sight", notes: "Select one robot in line of sight. That robot must make an immediate Will Roll (TN15). If it succeeds, nothing happens. If it fails, it immediately joins the crew of the activator as a temporary member. The controlled robot may make a new Will Roll (TN15) after each of its activations. If it succeeds this power is canceled and the robot immediately reverts to its previous allegiance. A figure with this power may only have one robot under control at any time. They may cancel this power at any time as a free action.", activation: 10, strain: 1),
        SamplePower(name: "Coordinated Fire", category: "Line of Sight", notes: "The target member of the crew receives +1 Shoot for the duration of the game. This may not take a figure above +5 Shoot. A figure may only benefit from one Coordinated Fire Power at a time.", activation: 10, strain: 0),
        SamplePower(name: "Create Robot", category: "Out of Game (A)", notes: "The player may immediately add one robot soldier to their crew for no cost. This soldier can be of any type except Armoured Trooper, but the crew is still subject to the normal limitation on soldiers and specialist soldiers.", activation: 14, strain: 0),
        SamplePower(name: "Dark Energy", category: "Line of Sight", notes: "The figure makes a +5 Shooting attack against any target within 12\". This attack ignores any armour worn by a figure (so subtract a figure's armour modifier from their armour). Increase this attack to +7 against robots. If this attack targets a figure in combat, do not randomize the target, it can only hit the intended target. (Armour Interference).", activation: 10, strain: 1),
        SamplePower(name: "Data Jump", category: "Line of Sight", notes: "This power may only target a member of the same warband that is carrying a data-loot token. The player may immediately move the data-loot token carried by that figure to another member of the crew, provided both are in line of sight of the activator and within 8\" of one another.", activation: 10, strain: 1),
        SamplePower(name: "Data Knock", category: "Line of Sight", notes: "Immediately unlocks one data-loot counter.", activation: 12, strain: 1),
        SamplePower(name: "Data Skip", category: "Line of Sight", notes: "This power targets an unlocked data-loot token or a figure carrying such a token that is within 12\". If the token is not being carried, the activator may move the data-loot token 4\" in any direction. If a figure is carrying the token, then that figure must make a Will Roll (TN16). If failed, the activator may move the data-loot token up to 4\" in any direction. Either way, the token remains unlocked.", activation: 12, strain: 2),
        SamplePower(name: "Destroy Weapon", category: "Line of Sight", notes: "This power may be used against any figure within 12\". The activator may choose one weapon carried by that figure to be destroyed, except indestructible weapons. This weapon is replaced for free after the game. (Armour Interference).", activation: 12, strain: 2),
        SamplePower(name: "Drone", category: "Touch", notes: "Place a drone next to the activator (see Chapter Six: Bestiary, page 144). This drone counts as a temporary member of the crew and may activate and move as normal. For the rest of the game, the figure may draw line of sight from the drone, instead of the figure, when using a power. This includes using Touch powers. A figure may only have one active drone at a time.", activation: 10, strain: 1),
        SamplePower(name: "Electromagnetic Pulse", category: "Line of Sight", notes: "If targeted against a robot, that robot must make an immediate Will Roll (TN18). If it fails, it receives no actions the next time it activates. If targeted against a non-robot figure, all firearms carried by that figure immediately jam as though they had rolled a 1 on a Shooting attack. Additionally, the weapon suffers a -1 Damage modifier for the rest of the game. A weapon can be jammed in multiple turns through the use of this power, but the Damage modifier only applies the first time.", activation: 10, strain: 1),
        SamplePower(name: "Energy Shield", category: "Self Only", notes: "A small energy shield forms around the user. This shield absorbs the next 3 points of Damage from any Shooting attack that would injusre the activator. Once 3 points of Damage have been absorbed, the power is cancelled.", activation: 10, strain: 0),
        SamplePower(name: "Fling", category: "Self Only or Touch", notes: "This power can be used in two ways. The activator may use it while standing within 1\" of a member of their crew, in which case they may immediately move that crewmember 6\" in any direction, including up. However, the figure that was moved is immediately stunned. Alternatively, it can be used while in combat against a specific enemy figure. The target figure must make an immediate Fight Roll (TN16). If it fails, the activator may move the target figure up to 6\" in any horizontal direction. The figure takes no Damage (unless there is another reason it would, such as falling), but is stunned. This power may not be used on any figure that has the Large attribute.",  activation: 8, strain: 1),
        SamplePower(name: "Fortune", category: "Self Only", notes: "Place a fortune token either next to the figure or on your crew sheet next to the figure’s entry. At any point the player may discard this token to reroll a Combat Roll, Shooting Roll, or Stat Roll made by that figure. If used, the figure must take the result of the reroll, they cannot choose to take the original roll. No figure may have more than one fortune token at one time.", activation: 12, strain: 0),
        SamplePower(name: "Haggle", category: "Out of Game (A)", notes: "This power may be used whenever a crew sells anything. The crew receives 20% more than the usual selling price. This power may only be used on the sale of one item after each game.", activation: 10, strain: 0),
        SamplePower(name: "Heal", category: "Line of Sight", notes: "This power restores up to 5 points of lost Health to a target figure within 6\". This power cannot take a figure above its starting Health. This power has no effect on robots. (Armour Interference).", activation: 10, strain: 0),
        SamplePower(name: "Holographic Wall", category: "Line of Sight", notes: "Creates a holographic wall 6\" long and 3\" high. No line of sight may be drawn through this wall. Figures may move through the wall as though it is not there. At the end of each turn, after the turn in which the wall is placed, roll a die. On a 1–4 the holograph fails, and the wall is removed.", activation: 10, strain: 1),
        SamplePower(name: "Life Leach", category: "Line of Sight", notes: "The target must make an immediately Will Roll (TN15). If failed the target loses 3 Health and the figure using the power regains 3 Health. This may not take a figure above its starting Health. This power cannot be used against robots. A figure may use this power on a member of their own crew, but if so, that figure is immediately removed from the crew sheet and counts as an uncontrolled figure for the rest of the game. (Armour Interference).", activation: 10, strain: 0),
        SamplePower(name: "Lift", category: "Line of Sight", notes: "Immediately move one member of the same crew that is in line of sight 6\" in any direction, including vertically. If this leaves the figure hanging above the ground, it immediately drops to the ground, but takes no Damage. The figure that is moved cannot take any additional actions this turn, though may have taken actions previously this turn. This may not move a figure off the table. (Armour Interference).", activation: 10, strain: 0),
        SamplePower(name: "Mystic Trance", category: "Out of Game (B)", notes: "If successfully activated, the figure may attempt to use one of their other powers before the first Initiative Roll as if it was an Out of Game (B) power. No power that targets a point on the table or an enemy figure can be used with Mystic Trance.", activation: 8, strain: 0),
        SamplePower(name: "Power Spike", category: "Self Only", notes: "The next time this figure makes a SHooting attack with a carbine, pistol, or shotgun, the shot does +3 Damage. This is cumulative with other damage modifiers for the weapon. For example, the total modifier would be +4 in the case of a shotgun (+3 from Power Spike and +1 from the Shotgun).", activation: 8, strain: 1),
        SamplePower(name: "Psionic Fire", category: "Self Only", notes: "The activator should place two flamethrower templates as thought the figure had just made a flamethrower attack. These templates may be touching, but may not overlap. Every figure touching a template immediately suffers a +3 flamethrower attack (see page 32). Figures only suffer one attack even if touching both templates. (Armour Interference).", activation: 10, strain: 1),
        SamplePower(name: "Pull", category: "Line of Sight", notes: "The target figure must make a Will Roll (TN16). If it fails, move that figure up to 6\" in any horizontal direction. This may not move a figure over terrain more than 0.5\" high. If this moves them off terrain that is above the ground, they fall and take Damage as normal. (Armour Interference).", activation: 12, strain: 1),
        SamplePower(name: "Puppet Master", category: "Touch", notes: "Choose one non-robot member of the crew that has been reduced to 0 Health during the game. That soldier returns to the table, adjacent to the figure activating this power. The soldier has 1 Health and counts as wounded. They are treated as a normal soldier in every other way. Any given soldier may only be returned to the table once each game through the use of Puppet Master. (Armour Interference).", activation: 12, strain: 2),
        SamplePower(name: "Psychic Shield", category: "Line of Sight", notes: "The target figure is surrounded by psychic energy. The next time it is hit with a Shooting attack that causes Damage of any amount, halve that Damage (rounding down), and then the power is cancelled. It this figure is ever in combat, this power is immediately cancelled. If the figure also has an active Energy Shield, deduct then 3 points of Damage for it first, then halve the remaining for the Psychic Shield. (Armour Interference).", activation: 10, strain: 2),
        SamplePower(name: "Regenerate", category: "Self Only", notes: "The activator regains up to 3 points of lost Health.", activation: 8, strain: 0),
        SamplePower(name: "Remote Guidance", category: "Out of Game (B) or Touch", notes: "This power may be used on any robot soldier. That robot can always activate in the same phase as the activator, even if it is not within 3\". The player is still limited to a maximum of three soldiers activating in either the Captain or First Mate Phase. An activator may only use Remote Guidance on one robot at a time.", activation: 10, strain: 0),
        SamplePower(name: "Remote Firing", category: "Line of Sight", notes: "This power allows the user to select one robot in the same crew that is within line of sight. That robot makes an immediate +3 Shooting attack against any legal target within 12\". This attack does not count as the robot’s activation, nor does it cost the robot an action.", activation: 10, strain: 0),
        SamplePower(name: "Repair Robot", category: "Line of Sight", notes: "This power restores up to 5 points of lost Health to a target robot within 6\". This power cannot take a figure above its starting Health.", activation: 10, strain: 0),
        SamplePower(name: "Restructure Body", category: "Self Only or Out of Game (B)", notes: "The activator gains one of the following traits of its choice: Amphibious, Burrowing, Expert Climber, Immune to Critical Hits, Immune to Toxins, or Never Wounded. It may only gain one of these traits at a time, but can change the attribute from one to another with an additional use of the power.", activation: 10, strain: 0),
        SamplePower(name: "Quick-Step", category: "Self Only", notes: "A figure may not make a Power Move when attempting to activate this power. The activator may immediately move 4\" in any direction, including out of combat. No figure may force combat during this move. The activator may not end this move within 1\" of an enemy figure nor exit the table using this move. This move does not suffer any movement penalties for terrain. If the figure fails its activation, it may make a normal Power Move.", activation: 10, strain: 1),
        SamplePower(name: "Re-wire Robot", category: "Out of Game (B)", notes: "Select one robot in the crew. The robot may be given one of the following enhancements: +1 Move, +1 Fight, +1 Armour; however, it suffers -1 Will. These modifications are permanent. No robot may be re-wired more than once.", activation: 14, strain: 0),
        SamplePower(name: "Suggestion", category: "Line of Sight", notes: "The target of this power must make an immediate Will Roll (TN16). If it fails, it drops any loot it is carrying, and the activator may move the figure up to 3\" in any direction, provided this does not move the figure into combat or cause it any immediate Damage (i.e. falling more than 3”). (Armour Interference).", activation: 12, strain: 1),
        SamplePower(name: "Target Designation", category: "Line of Sight", notes: "For the rest of the battle, this figure receives -2 Fight whenever rolling against a Shooting attack.", activation: 8, strain: 0),
        SamplePower(name: "Target Lock", category: "Touch", notes: "The activator may make an immediate grenade or grenade launcher attack as a free action against any point in range; it does not have to be in line of sight. The attack automatically hits its intended point. If this power is used during a group activation, then the grenade or grenade launcher attack can be made by another member of the crew that is within 1\" and was part of the group activation.", activation: 10, strain: 1),
        SamplePower(name: "Temporary Upgrade", category: "Self Only", notes: "The activator may select one of the following stat increases: +1 Move, +1 Fight, +1 Shoot, +3 Will, +1 Armour. These may not take the figure above Move (7), Fight (+6), Shoot (+6), Will (+8), or Armour (14). A figure may only have one upgrade activate a time, but they may use this power again to switch from one upgrade to another.", activation: 12, strain: 0),
        SamplePower(name: "Toxic Claws", category: "Self Only", notes: "The figure immediately grows a set of indestructible claws. These count as a hand weapon, do +2 Damage, and are toxic.", activation: 10, strain: 1),
        SamplePower(name: "Toxic Secretion", category: "Out of Game (B)", notes: "The activator may select up to two members of their crew, including itself. All attacks made by those figures, including Shooting attacks, count as toxic for the next game.", activation: 12, strain: 0),
        SamplePower(name: "Transport", category: "Line of Sight", notes: "May target one member of the same crew that is within Line of Sight and 12\" from the activator. This figure can be moved up to 6\" in any direction (maintaining line of sight). If the figure was carrying a loot token, the token is dropped and not moved with the figure.", activation: 10, strain: 1),
        SamplePower(name: "Void Blade", category: "Self Only", notes: "A figure must be carrying a hand weapon in order to use this power. This hand weapon becomes indestructible and does +2 Damage. In addition, the figure receives +3 Fight whenever they are rolling against a Shooting attack generated by a pistol, carbine, rapid-fire, or shotgun. This bonus does not stack with cover; the player should use whichever modifier is greater. If this figure ever becomes stunned, this power is immediately cancelled. A figure with an active void blade cannot use any weapon that takes up more than 1 gear slot.", activation: 10, strain: 0),
        SamplePower(name: "Wall of Force", category: "Self Only", notes: "Creates an impenetrable, transparent wall, up to 6\" long and 3\" high anywhere within line of sight of the activator. This wall cannot be climbed (though any point it is anchored on may be). Grenade and grenade launcher attacks may be made over the wall. Figures may make a Shooting action at the wall. In that case, roll a die, on a 19–20, the wall is immediately cancelled.", activation: 12, strain: 1)
    ]
}