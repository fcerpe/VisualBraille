% (C) Copyright 2020 CPP visual motion localizer developpers

function varargout = vbBlock_preTrialSetup(varargin)
    % varargout = postInitializatinSetup(varargin)

    % generic function to prepare some structure before each trial

    [cfg, iBlock, iEvent, iRun] = deal(varargin{:});

    % trial_type is defined by the currentCondition: 
    % 1-8 = french, 9-16 = braille, 17 = blank
    thisEvent.trial_type = char(cfg.design.blockMatrix(iRun, iBlock));
    
    if cfg.design.targetMatrix(iBlock,iEvent,iRun)
        thisEvent.trial_type = 'target';
    end
%     thisEvent.trial_type = cfg.design.blockNames{iBlock};
    thisEvent.target = cfg.design.targetMatrix(iBlock, iEvent, iRun);

    % If this frame shows a target we change the color of the cross
    thisFixation.fixation = cfg.fixation;
    thisFixation.screen = cfg.screen;
    
    % Maybe load the image? 

    varargout = {thisEvent, thisFixation, cfg};
end
