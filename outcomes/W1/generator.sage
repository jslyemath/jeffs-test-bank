import sys
sys.path.append('/home/slye/jeffs-test-bank/outcomes')
import slye_math as sm


class Generator(BaseGenerator):

    def data(self):
        def bab_modern():
            modern = choice(range(3501, 162000))
            bab = sm.to_simple_babylonian(modern)
            return bab, modern, 'ancient Babylonian'

        def rom_modern():
            modern = int(sm.int_creator(4, (0, 4, 5, 6, 7, 8, 9), wt_0=.03, wt_4=.2, wt_6=.2, wt_9=.2))
            rom = sm.to_roman(modern)
            return rom, modern, 'Roman'

        def egy_modern():
            modern = choice(range(100000, 4000000))
            egy = sm.to_egyptian(modern)
            return egy, modern, 'ancient Egyptian'

        other_system = choice([rom_modern, egy_modern])
        to_ancient_func, to_modern_func = shuffle([bab_modern, other_system])

        to_a_ancient, to_a_modern, to_a_system = to_ancient_func()
        to_m_ancient, to_m_modern, to_m_system = to_modern_func()

        return {
            'to_ancient_prompt': f'Convert {to_m_modern} to ancient {to_m_system}.',
            'to_ancient_answer': f'{to_a_ancient}',
            'to_modern_prompt': f'Convert {to_a_ancient} from {to_a_system} to modern Hindu-Arabic base ten.',
            'to_modern_answer': f'{to_m_modern}'
        }
