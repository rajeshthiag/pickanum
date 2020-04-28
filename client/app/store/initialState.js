import clientSettingsStore from './clientSettingsStore';
import translator from '../services/translator';


const DEFAULT_LANGUAGE = 'en';
const userLanguage = clientSettingsStore.getPresetLanguage();

/**
 * The initial state that is loaded into the redux store on (client) application load.
 */
const INITIAL_STATE = {
// TODO: evaluate if creator of room must be able to choose card values. store creator's selection to local storage and use as default
  cardConfig: [
    {label: '?', value: -2, color: '#FF6961'},
    {label: '1/2', value: 0.5, color: '#FFB447'},
    {label: '1', value: 1, color: '#F7EF64'},
    {label: '2', value: 2, color: '#87DCC0'},
    {label: '3', value: 3, color: '#769ECB'},
    {label: '5', value: 5, color: '#CE9DD9'},
  ],
  presetUsername: clientSettingsStore.getPresetUsername(),
  presetEmail: clientSettingsStore.getPresetEmail(),
  presetUserId: clientSettingsStore.getPresetUserId(),
  roomHistory: clientSettingsStore.getRoomHistory(),
  userMenuShown: false,
  actionLog: [], // will contain human readable "log messages" of actions that did take place in the current room
  pendingCommands: {}, // will contain pending commands (commands for which no event is received yet)
  language: userLanguage || DEFAULT_LANGUAGE,
  translator: key => translator(key, userLanguage || DEFAULT_LANGUAGE)
};

export default INITIAL_STATE;
