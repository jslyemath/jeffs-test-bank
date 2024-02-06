import sys
sys.path.append('/home/slye/jeffs-test-bank/outcomes')
import slye_math as sm


class Generator(BaseGenerator):

    def data(self):
        def bab_modern():
            modern = choice(range(3501, 162000))
            bab = sm.to_simple_babylonian(modern)
            return bab, modern, 'Babylonian'

        def rom_modern():
            modern = int(sm.int_creator(4, (0, 4, 5, 6, 7, 8, 9), wt_0=.03, wt_4=.2, wt_6=.2, wt_9=.2))
            rom = sm.to_roman(modern)
            return rom, modern, 'Roman'

        def egy_modern():
            modern = choice(range(100000, 4000000))
            egy = sm.to_egyptian(modern)
            return egy, modern, 'Egyptian'

        to_bab = choice([True, False])
        osys_modern = choice([rom_modern, egy_modern])

        # from_wording = f'Convert {} from ancient {} to modern Hindu-Arabic base ten.'
        # to_wording = f'Convert {} to ancient {}.'

        # if to_bab:


        # problem1_data = {
        #     'to_from1' =
        # }

        return {
            "test1": egy_modern(),
            "test2": 'hi',
        }
