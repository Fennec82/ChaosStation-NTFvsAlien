import { Button, NoticeBox, ProgressBar, Stack } from 'tgui-core/components';
import {
  KEY_1,
  KEY_2,
  KEY_3,
  KEY_4,
  KEY_5,
  KEY_6,
  KEY_A,
  KEY_D,
  KEY_DOWN,
  KEY_ENTER,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_S,
  KEY_SPACE,
  KEY_UP,
  KEY_W,
} from 'tgui-core/keycodes';

import { useBackend } from '../backend';
import { Window } from '../layouts';

// _DEFINES/cas.dm
enum PlaneState {
  ACTIVATED = 0,
  DEACTIVATED = 1,
  PREPARED = 2,
  FLYING = 3,
}

enum PlaneLocation {
  IN_HANGAR = 0,
  IN_SPACE = 1,
}

type CasData = {
  plane_state: number;
  location_state: number;
  plane_mode: string;
  fuel_left: number;
  fuel_max: number;
  attackdir: string;
  all_weapons: CasWeapon[];
  active_lasers: number;
  active_weapon_tag: number;
};

type CasWeapon = {
  name: string;
  ammo?: number;
  max_ammo?: number;
  ammo_name?: string;
  eqp_tag: number;
};

export const MarineCasship = (props) => {
  const { act, data } = useBackend<CasData>();
  return (
    <Window
      width={590}
      height={data.plane_state === PlaneState.ACTIVATED ? 170 : 285}
      theme="ntos"
    >
      <Window.Content
        onKeyDown={(event) => {
          const keyCode = window.event ? event.which : event.keyCode;
          if (keyCode === KEY_ENTER) {
            act('toggle_engines');
          }
          if (keyCode === KEY_SPACE) {
            act('launch');
          }
          if (keyCode === KEY_1) {
            act('change_weapon', { selection: 1 });
          }
          if (keyCode === KEY_2) {
            act('change_weapon', { selection: 2 });
          }
          if (keyCode === KEY_3) {
            act('change_weapon', { selection: 3 });
          }
          if (keyCode === KEY_4) {
            act('change_weapon', { selection: 4 });
          }
          if (keyCode === KEY_5) {
            act('change_weapon', { selection: 5 });
          }
          if (keyCode === KEY_6) {
            act('deselect');
          }
          if (data.plane_state !== PlaneState.ACTIVATED) {
            let newdir = 0;
            switch (keyCode) {
              case KEY_UP:
              case KEY_W:
                newdir = 1;
                if (data.attackdir === 'NORTH') {
                  return;
                }
                break;
              case KEY_DOWN:
              case KEY_S:
                newdir = 2;
                if (data.attackdir === 'SOUTH') {
                  return;
                }
                break;
              case KEY_RIGHT:
              case KEY_D:
                newdir = 4;
                if (data.attackdir === 'EAST') {
                  return;
                }
                break;
              case KEY_LEFT:
              case KEY_A:
                newdir = 8;
                if (data.attackdir === 'WEST') {
                  return;
                }
                break;
              default:
                return;
            }
            act('cycle_attackdir', { newdir: newdir });
          }
        }}
      >
        {data.plane_state === PlaneState.ACTIVATED ? (
          <EnginesOff />
        ) : (
          <NormalOperation />
        )}
      </Window.Content>
    </Window>
  );
};

const EnginesOff = (props) => {
  const { act, data } = useBackend<CasData>();
  const { fuel_left, fuel_max } = data;
  return (
    <Stack fill>
      <Stack.Item grow>
        <Button
          fluid
          textAlign="center"
          fontSize="30px"
          content="Spool Engines"
          onClick={() => act('toggle_engines')}
          disabled={fuel_left <= 0}
        />
        <NoticeBox textAlign="center" fontSize="20px">
          Fuel level
        </NoticeBox>
        <ProgressBar
          value={fuel_left / fuel_max}
          ranges={{
            good: [0.67, Infinity],
            average: [0.33, 0.67],
            bad: [-Infinity, 0.33],
          }}
        />
      </Stack.Item>
      <Stack.Item>
        <Button
          textAlign="center"
          fontSize="20px"
          height="100%"
          content="Eject"
          color="red"
          onClick={() => act('eject')}
          disabled={fuel_left <= 0}
        />
      </Stack.Item>
    </Stack>
  );
};

const NormalOperation = (props) => {
  const { act, data } = useBackend<CasData>();
  const {
    plane_state,
    location_state,
    attackdir,
    active_lasers,
    fuel_left,
    fuel_max,
    all_weapons,
    active_weapon_tag,
  } = data;
  return (
    <Stack vertical fill>
      <Stack.Item>
        <Stack>
          <Stack.Item>
            <Stack vertical>
              <Stack.Item>
                <Stack>
                  <Stack.Item>
                    <LaunchLandButton />
                  </Stack.Item>
                  <Stack.Item>
                    <EngineFiremissionButton />
                  </Stack.Item>
                  <Stack.Item>
                    <NoticeBox fontSize="17px">
                      {active_lasers} Active lasers
                    </NoticeBox>
                  </Stack.Item>
                </Stack>
              </Stack.Item>
              <Stack.Item>
                <Stack>
                  <Stack.Item>
                    <NoticeBox mt={0.2}>Fuel:</NoticeBox>
                  </Stack.Item>
                  <Stack.Item grow>
                    <ProgressBar
                      fontSize="16px"
                      ranges={{
                        good: [0.5, Infinity],
                        average: [-Infinity, 0.25],
                      }}
                      value={fuel_left / fuel_max}
                    >
                      Fuel
                    </ProgressBar>
                  </Stack.Item>
                </Stack>
              </Stack.Item>
            </Stack>
          </Stack.Item>
          <Stack.Item>
            <Button
              fontSize="43px"
              icon={getDirectionArrow(attackdir)}
              tooltip="Direction of strafe"
              onClick={() => act('cycle_attackdir')}
              disabled={
                plane_state !== PlaneState.FLYING ||
                location_state !== PlaneLocation.IN_SPACE
              }
            />
          </Stack.Item>
        </Stack>
      </Stack.Item>
      {all_weapons.map((equipment) => (
        <Stack.Item key={equipment.eqp_tag}>
          <Stack fill>
            <Stack.Item>
              <Button
                fontSize="16px"
                width="280px"
                tooltip={equipment.name}
                onClick={() =>
                  act('change_weapon', { selection: equipment.eqp_tag })
                }
                color={equipment.eqp_tag === active_weapon_tag ? 'red' : null}
              >
                {equipment.ammo_name ? equipment.ammo_name : equipment.name}
              </Button>
            </Stack.Item>
            <Stack.Item grow>
              <ProgressBar
                fontSize="16px"
                ranges={{
                  good: [0.5, Infinity],
                  average: [-Infinity, 0.25],
                }}
                value={
                  equipment.ammo && equipment.max_ammo
                    ? equipment.ammo / equipment.max_ammo
                    : 0
                }
              >
                {equipment.ammo_name}
              </ProgressBar>
            </Stack.Item>
          </Stack>
        </Stack.Item>
      ))}
    </Stack>
  );
};

const LaunchLandButton = (props) => {
  const { act, data } = useBackend<CasData>();
  const { plane_state, plane_mode } = data;
  return plane_state === PlaneState.FLYING ? (
    <Button
      fontSize="20px"
      onClick={() => act('land')}
      disabled={plane_mode !== 'idle'}
    >
      Land plane
    </Button>
  ) : (
    <Button
      fontSize="20px"
      onClick={() => act('launch')}
      disabled={plane_mode !== 'idle'}
    >
      Launch plane
    </Button>
  );
};

const EngineFiremissionButton = (props) => {
  const { act, data } = useBackend<CasData>();
  const { plane_state, location_state } = data;
  return plane_state === PlaneState.PREPARED ? (
    <Button fontSize="20px" onClick={() => act('toggle_engines')}>
      Disable Engines
    </Button>
  ) : (
    <Button
      fontSize="20px"
      onClick={() => act('deploy')}
      disabled={
        plane_state !== PlaneState.FLYING ||
        location_state !== PlaneLocation.IN_SPACE
      }
    >
      Begin Firemission
    </Button>
  );
};

function getDirectionArrow(dir) {
  const directionMap = {
    NORTH: 'arrow-up',
    SOUTH: 'arrow-down',
    EAST: 'arrow-right',
    WEST: 'arrow-left',
  };
  return directionMap[dir] || 'arrow-up';
}
