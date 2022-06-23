# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

simulation = Simulation.create!(name: 'Solar System', solver_method: 'RK45')

Universe.create!(simulation: simulation, start_time: 0.0, end_time: 1000.0, timestep: 1.0)

# All initial states are according to NASA'S Horizons system for the datetime January 01, 2022.
SpacecraftBody.create!(simulation: simulation, name: 'Hubble', radius: 13,
                       initial_position_x: -274_100_801.94310544,
                       initial_position_y: 145_274_178.1899363,
                       initial_position_z: 13_804.01380202919,
                       initial_velocity_x: -37.29652332516753,
                       initial_velocity_y: -5.770702509535885,
                       initial_velocity_z: -1.251987998205182)

GravityBody.create!(simulation: simulation, name: 'Sol', radius: 695_700, gm: 132_712_440_041.93938,
                    initial_position_x: -1_283_674.643550172,
                    initial_position_y: 500_710.4996950605,
                    initial_position_z: 25_893.97504295033,
                    initial_velocity_x: -0.005809369653802155,
                    initial_velocity_y: -1.461959576560110,
                    initial_velocity_z: 0.0002513455442031695)

GravityBody.create!(simulation: simulation, name: 'Mercury', radius: 2440, gm: 22_031.86855,
                    initial_position_x: 52_426_172.05495467,
                    initial_position_y: -5_596_063.357617276,
                    initial_position_z: -5_398_976.570474024,
                    initial_velocity_x: -3.931719860392732,
                    initial_velocity_y: 50.56613955108243,
                    initial_velocity_z: 4.493726800433638)

GravityBody.create!(simulation: simulation, name: 'Venus', radius: 6051.84, gm: 324_858.592,
                    initial_position_x: -11_436_128.8965462,
                    initial_position_y: 107_618_039.155214,
                    initial_position_z: 2_081_921.801192194,
                    initial_velocity_x: -34.9895853252422,
                    initial_velocity_y: -3.509011592387367,
                    initial_velocity_z: 1.971012081662609)

GravityBody.create!(simulation: simulation, name: 'Earth', radius: 6371.01, gm: 398_600.435436,
                    initial_position_x: -27_411_475.60901964,
                    initial_position_y: 145_269_749.9646169,
                    initial_position_z: 19_074.99306293577,
                    initial_velocity_x: -29.81801522121922,
                    initial_velocity_y: -5.415519940416356,
                    initial_velocity_z: 0.001781036907294364)

GravityBody.create!(simulation: simulation, name: 'Luna', radius: 1737.53, gm: 4902.800066,
                    initial_position_x: -27_503_344.15265606,
                    initial_position_y: 144_922_907.1220244,
                    initial_position_z: 11_076.72420730442,
                    initial_velocity_x: -28.75697243341937,
                    initial_velocity_y: -5.673128746911559,
                    initial_velocity_z: -0.09368517608037941)

GravityBody.create!(simulation: simulation, name: 'Mars', radius: 3389.92, gm: 42_828.375214,
                    initial_position_x: -130_951_073.7126251,
                    initial_position_y: -189_312_739.8896606,
                    initial_position_z: -771_445.010984391,
                    initial_velocity_x: 20.90994471204196,
                    initial_velocity_y: -11.60503586188451,
                    initial_velocity_z: -0.7557181497936503)

# TODO: Get a better GM value for Deimos
GravityBody.create!(simulation: simulation, name: 'Deimos', radius: 6, gm: 1,
                    initial_position_x: -130_935_212.0544367,
                    initial_position_y: -189_327_841.2995104,
                    initial_position_z: -779_858.1976956129,
                    initial_velocity_x: 21.73661848056722,
                    initial_velocity_y: -10.57596188620493,
                    initial_velocity_z: -1.043709787303636)

GravityBody.create!(simulation: simulation, name: 'Phobos', radius: 1737.53, gm: 4902.800066,
                    initial_position_x: -27_503_344.15265606,
                    initial_position_y: 144_922_907.1220244,
                    initial_position_z: 11_076.72420730442,
                    initial_velocity_x: -28.75697243341937,
                    initial_velocity_y: -5.673128746911559,
                    initial_velocity_z: -0.09368517608037941)

GravityBody.create!(simulation: simulation, name: 'Ceres', radius: 469.7, gm: 62.6284,
                    initial_position_x: 122_215_677.056317,
                    initial_position_y: 387_802_111.1231923,
                    initial_position_z: -10_489_811.23398148,
                    initial_velocity_x: -17.42286744757721,
                    initial_velocity_y: 4.164868753473149,
                    initial_velocity_z: 3.34112236793552)

GravityBody.create!(simulation: simulation, name: 'Vesta', radius: 262.7, gm: 17.28824,
                    initial_position_x: -73_673_425.49682397,
                    initial_position_y: -312_819_359.4269003,
                    initial_position_z: 18_200_979.41413352,
                    initial_velocity_x: 20.45537584408066,
                    initial_velocity_y: -4.936979251974176,
                    initial_velocity_z: -2.342248905398383)

GravityBody.create!(simulation: simulation, name: 'Jupiter', radius: 69_911, gm: 126_686_531.900,
                    initial_position_x: 695_555_471.3494443,
                    initial_position_y: -267_962_004.0967891,
                    initial_position_z: -14_449_597.69995748,
                    initial_velocity_x: 4.539612624165795,
                    initial_velocity_y: 12.80513202430234,
                    initial_velocity_z: -0.1547160200183022)

GravityBody.create!(simulation: simulation, name: 'Io', radius: 1821.49, gm: 5959.9155,
                    initial_position_x: 695_907_250.4116458,
                    initial_position_y: -267_726_676.1893137,
                    initial_position_z: -14_435_742.90083547,
                    initial_velocity_x: -5.056946392869844,
                    initial_velocity_y: 27.15548637270523,
                    initial_velocity_z: 0.2123705829815030)

GravityBody.create!(simulation: simulation, name: 'Europa', radius: 1560.8, gm: 3202.7121,
                    initial_position_x: 695_119_886.9601960,
                    initial_position_y: -267_452_313.6935304,
                    initial_position_z: -14_440_251.68386361,
                    initial_velocity_x: -5.996681097098228,
                    initial_velocity_y: 3.983989140848177,
                    initial_velocity_z: -0.7225363651371252)

GravityBody.create!(simulation: simulation, name: 'Ganymede', radius: 2631.2, gm: 9887.8328,
                    initial_position_x: 695_499_631.5134706,
                    initial_position_y: -269_028_536.4431954,
                    initial_position_z: -14_490_999.61661768,
                    initial_velocity_x: 15.42064410563295,
                    initial_velocity_y: 12.24438813385608,
                    initial_velocity_z: -0.02620198214606706)

GravityBody.create!(simulation: simulation, name: 'Callisto', radius: 2410.3, gm: 7179.2834,
                    initial_position_x: 694_997_678.3508239,
                    initial_position_y: -269_765_143.7224568,
                    initial_position_z: -14_514_003.17047673,
                    initial_velocity_x: 12.36891684981622,
                    initial_velocity_y: 10.44024148568503,
                    initial_velocity_z: -0.1245196523029448)

GravityBody.create!(simulation: simulation, name: 'Saturn', radius: 58_232, gm: 37_931_206.234,
                    initial_position_x: 1.039929082221698,
                    initial_position_y: -1_056_650_148.100382,
                    initial_position_z: -23_030_987.68547428,
                    initial_velocity_x: 6.345150014839902,
                    initial_velocity_y: 6.756117343710409,
                    initial_velocity_z: -0.3704447196861729)

GravityBody.create!(simulation: simulation, name: 'Mimas', radius: 198.8, gm: 2.503489,
                    initial_position_x: 1_040_051_795.086284,
                    initial_position_y: -1_056_537_945.056232,
                    initial_position_z: -23_104_895.86311907,
                    initial_velocity_x: -4.340955027242412,
                    initial_velocity_y: 15.81855293716931,
                    initial_velocity_z: -4.457584929846970)

GravityBody.create!(simulation: simulation, name: 'Enceladus', radius: 252.3, gm: 7.210367,
                    initial_position_x: 1_039_908_384.966456,
                    initial_position_y: -1_056_440_000.717037,
                    initial_position_z: -23_139_066.05287486,
                    initial_velocity_x: -6.233241016785717,
                    initial_velocity_y: 6.236574823729578,
                    initial_velocity_z: 1.119596332879957)

GravityBody.create!(simulation: simulation, name: 'Tethys', radius: 536.3, gm: 41.21,
                    initial_position_x: 1_039_664_327.078955,
                    initial_position_y: -1_056_528_604.034545,
                    initial_position_z: -23_075_364.11198193,
                    initial_velocity_x: 1.423615712320219,
                    initial_velocity_y: -2.093967445840011,
                    initial_velocity_z: 4.758059947384462)

GravityBody.create!(simulation: simulation, name: 'Dione', radius: 562.5, gm: 73.116,
                    initial_position_x: 1_040_096_903.29198,
                    initial_position_y: -1_056_955_197.209077,
                    initial_position_z: -22_887_502.87764066,
                    initial_velocity_x: 15.2995700789046,
                    initial_velocity_y: 10.38189983989699,
                    initial_velocity_z: -3.143183443668258)

GravityBody.create!(simulation: simulation, name: 'Rhea', radius: 764.5, gm: 153.94,
                    initial_position_x: 1_039_907_020.171028,
                    initial_position_y: -1_056_182_795.052301,
                    initial_position_z: -23_274_121.82130677,
                    initial_velocity_x: -2.101910893245208,
                    initial_velocity_y: 6.761031061229666,
                    initial_velocity_z: 0.3921935284584719)

GravityBody.create!(simulation: simulation, name: 'Titan', radius: 2575.5, gm: 8978.14,
                    initial_position_x: 1_039_345_278.187443,
                    initial_position_y: -1_055_650_336.221334,
                    initial_position_z: -23_488_311.55002218,
                    initial_velocity_x: 1.484636279736459,
                    initial_velocity_y: 4.758546615179409,
                    initial_velocity_z: 1.143821430421425)

GravityBody.create!(simulation: simulation, name: 'Hyperion', radius: 133, gm: 0.3705,
                    initial_position_x: 1_040_261_179.912377,
                    initial_position_y: -1_057_807_376.793948,
                    initial_position_z: -22_482_457.58373028,
                    initial_velocity_x: 11.66825181800471,
                    initial_velocity_y: 8.133008546495027,
                    initial_velocity_z: -1.569627101381762)

GravityBody.create!(simulation: simulation, name: 'Iapetus', radius: 734.5, gm: 120.52,
                    initial_position_x: 1_042_590_080.724535,
                    initial_position_y: -1_058_915_040.855862,
                    initial_position_z: -23_044_887.40580535,
                    initial_velocity_x: 8.346959242842134,
                    initial_velocity_y: 9.224402225331355,
                    initial_velocity_z: -1.346029355109544)

GravityBody.create!(simulation: simulation, name: 'Uranus', radius: 25_362, gm: 5_793_951.256,
                    initial_position_x: 2_152_570_437.700128,
                    initial_position_y: 2_016_888_245.555490,
                    initial_position_z: -20_396_111.92913723,
                    initial_velocity_x: -4.705853565766252,
                    initial_velocity_y: 4.652144641704226,
                    initial_velocity_z: 0.07821724397220797)

# TOOD: Get a better GM value for Miranda
GravityBody.create!(simulation: simulation, name: 'Miranda', radius: 235, gm: 1,
                    initial_position_x: 2_152_522_815.491436,
                    initial_position_y: 2_016_871_907.324497,
                    initial_position_z: -20_515_681.48066592,
                    initial_velocity_x: -10.78382685765247,
                    initial_velocity_y: 6.372776892316494,
                    initial_velocity_z: 2.27036574391483)

# TODO: Get a better GM value for Ariel
GravityBody.create!(simulation: simulation, name: 'Ariel', radius: 580, gm: 1,
                    initial_position_x: 2_152_551_913.189095,
                    initial_position_y: 2_016_866_194.785256,
                    initial_position_z: -20_584_867.49160576,
                    initial_velocity_x: -10.06338906871095,
                    initial_velocity_y: 5.876433471929257,
                    initial_velocity_z: 0.4579554880613448)

# TODO: Get a better GM value for Umbriel
GravityBody.create!(simulation: simulation, name: 'Umbriel', radius: 584.7, gm: 1,
                    initial_position_x: 2_152_690_698.261051,
                    initial_position_y: 2_016_830_017.189993,
                    initial_position_z: -20_627_200.8367734,
                    initial_velocity_x: -8.743273620618746,
                    initial_velocity_y: 5.223000628955935,
                    initial_velocity_z: -2.158629756492221)

# TODO: Get a better GM value for Titania
GravityBody.create!(simulation: simulation, name: 'Titania', radius: 788.9, gm: 1,
                    initial_position_x: 2_152_514_323.810390,
                    initial_position_y: 2_016_840_561.32074,
                    initial_position_z: -20_825_347.61990464,
                    initial_velocity_x: -8.24280273214757,
                    initial_velocity_y: 5.479618311914814,
                    initial_velocity_z: 0.4481501170082851)

# TODO: Get a better GM value for Oberon
GravityBody.create!(simulation: simulation, name: 'Oberon', radius: 761.4, gm: 1,
                    initial_position_x: 2_152_333_092.29537,
                    initial_position_y: 2_016_864_101.339479,
                    initial_position_z: -2.092932293661332,
                    initial_velocity_x: -7.507530394057015,
                    initial_velocity_y: 5.433309757220418,
                    initial_velocity_z: 1.282324016767934)

GravityBody.create!(simulation: simulation, name: 'Neptune', radius: 24_624, gm: 6_835_099.97,
                    initial_position_x: 4_431_790_029.647159,
                    initial_position_y: -611_448_687.826174,
                    initial_position_z: -89_543_484.55674592,
                    initial_velocity_x: 0.706624866611745,
                    initial_velocity_y: 5.417073900824804,
                    initial_velocity_z: -0.1271380125837618)

GravityBody.create!(simulation: simulation, name: 'Triton', radius: 1352.6, gm: 1428.495,
                    initial_position_x: 4_432_080_457.839645,
                    initial_position_y: -611_253_089.9554114,
                    initial_position_z: -89_600_463.75556546,
                    initial_velocity_x: 1.830212936883987,
                    initial_velocity_y: 2.78006103831639,
                    initial_velocity_z: -3.452064385124581)

GravityBody.create!(simulation: simulation, name: 'Pluto', radius: 1188.3, gm: 869.61,
                    initial_position_x: 2_261_645_942.756855,
                    initial_position_y: -4_624_320_183.370165,
                    initial_position_z: -159_371_460.5425928,
                    initial_velocity_x: 5.02567905246904,
                    initial_velocity_y: 1.212540589088879,
                    initial_velocity_z: -1.601466503877212)

GravityBody.create!(simulation: simulation, name: 'Charon', radius: 603.6, gm: 105.88,
                    initial_position_x: 2_261_635_003.577778,
                    initial_position_y: -4_624_335_494.430189,
                    initial_position_z: -159_376_932.7466421,
                    initial_velocity_x: 4.919077344038042,
                    initial_velocity_y: 1.218680780302101,
                    initial_velocity_z: -1.405572542297708)

# TOOD: Find a better GM value for Haumea
GravityBody.create!(simulation: simulation, name: 'Haumea', radius: 620, gm: 1,
                    initial_position_x: -5_828_232_709.458652,
                    initial_position_y: -3_140_843_468.775124,
                    initial_position_z: 3_543_578_578.542094,
                    initial_velocity_x: 2.176939860309149,
                    initial_velocity_y: -3.16804987642875,
                    initial_velocity_z: -0.09165836535922023)

# TOOD: Find a better GM value for makemake
GravityBody.create!(simulation: simulation, name: 'Makemake', radius: 715, gm: 1,
                    initial_position_x: -6_907_422_621.715428,
                    initial_position_y: -884_209_266.5643032,
                    initial_position_z: 3_674_523_290.305331,
                    initial_velocity_x: 0.1010018325004833,
                    initial_velocity_y: -3.745828188511329,
                    initial_velocity_z: -0.435530322470737)

# TODO: Find a better GM value for Eris
GravityBody.create!(simulation: simulation, name: 'Eris', radius: 1163, gm: 1,
                    initial_position_x: 12_845_823_133.44951,
                    initial_position_y: 5_713_305_508.934446,
                    initial_position_z: -2_821_797_780.558837,
                    initial_velocity_x: -0.7426228412378878,
                    initial_velocity_y: 1.518185135800477,
                    initial_velocity_z: 1.607342746462931)
