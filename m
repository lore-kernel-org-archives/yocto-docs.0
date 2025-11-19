Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3E5CF3951
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:17:09 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10989.1763569019803102662
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 08:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=foqHmkfF;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8823fa3bd95so8577436d6.1
        for <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 08:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763569017; x=1764173817; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jCpQ7q5zN3Ufg11G/Ga3PpXkMPCszcKCZW8R2OBOwlE=;
        b=foqHmkfFU0KIHED8fkqzmbaRBKnBvD/xOh6FlfK4Kj8hHVPEmjnGzNCvGRQ5RRtbEV
         EJGn1oUEnah7jUbpZm6vh27DFqtsqM0Xy216nKYUrt21I42mNBYqfpWAYlna+OcPIDpF
         rws64DY/fF71JfK/GnWam2H3iNaZbCwluQe2q3YCpaJx3d/YHcHm0EgSO2NnlAA80Sk0
         vjbbataWDC2gDaGNh5wmAIQaiHEMK610OY0OGouwxvQZp5B0hq7M4g90T8tf/7qib6Ng
         EhaN81+wJsHS51TWDPipqUu1S7BulNvxSpLuaPdbBM4h7e7U04xmVlpWCf1b7uJLbjmH
         vBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569017; x=1764173817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCpQ7q5zN3Ufg11G/Ga3PpXkMPCszcKCZW8R2OBOwlE=;
        b=iGiIFmr14xy2h0rOJTuuMigfC9Uo6Xw1zFTulbD3fdJNtsBiuREKERXfhX4H7ELlD8
         iIXz5APcwU1QAy0fFEYZzqPhPViceSx3ee36C+TAvESGB8C8m0M+f7RsYvUj4wqrCDs+
         AI+gAdg27D9MAfXCstXYM2kW5dkGcRJoYRVEy5DJudXTmOihN6qX91ICfV930tK9hOz8
         lho5uYbYXFofom9Qd5KToLq9kYGKTKkQT8Yx2lZfm5z+RSFTJSnq4gwny2iEgU5+Y78q
         0cyMC4guILNv1Pace40godlp0zSWyHL3PoxfEHvFtM+v+1F2xddcbMkRiYniBjqRt6pU
         1p3w==
X-Gm-Message-State: AOJu0Yyge/UmER0KuH6L13qd1YqOER7deCBSK3ivhEqq03CHKtMQbz/L
	0SrF8gnl8A+r9CNhaiyjrIsHhkVdY0VGHyM9kWuTatYYmFe7ww0eZZyQGHYdkN0AbCg+A6uloeT
	PKTXeRmgQx7qji1b6pikzSuVdP3zna3Y=
X-Gm-Gg: ASbGncvsL9ijVxnRFq7WTvazgieT6A/L6XkDV9pbcoWR0lddXk5fTWFw4BjSlcW3Jqr
	UENUudStDKck40eBkh0+psVh/tiTV5dupRCs6pyLzRlnj4ag+4SAETNxfhgxTSQHv+fBpjncAFV
	OoUjRmvofbQW8MRe9F5Dqm+jXRWxxJWjFoqz0oJfmrFx3MWkSpKGdPYW/HV8A8+RLfuAH/L5Vcn
	M8iSpo5tgsI5G08A5go4JHmduoqp6onk3E8BAFF3h9DiDDX93oH3++t/3SOYhlSRmDVaFNzKSVO
	1EECA6CxQsaNgG5QXowGOKP7yZpNPNXsbL1wdnL3
X-Google-Smtp-Source: AGHT+IFIM4OqzbqB0orDT8pUGGNd8bkefzq9hXs67cAqmQashaV/BlJ8oiRaTNUTsQJFF52pKYYpi+c0ic5Xdn8jHDE=
X-Received: by 2002:a05:6214:5f01:b0:880:44ca:69b0 with SMTP id
 6a1803df08f44-884603224c4mr43877956d6.17.1763569016695; Wed, 19 Nov 2025
 08:16:56 -0800 (PST)
MIME-Version: 1.0
References: <2049e12f-12f7-dad3-c14f-c5fd384a98b9@crashcourse.ca>
In-Reply-To: <2049e12f-12f7-dad3-c14f-c5fd384a98b9@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Nov 2025 17:16:43 +0100
X-Gm-Features: AWmQ_bmA18_g1Z1T0jRWnCUPXL5qsxdeRdf4sgxJcu51zLOp9DM4JoG7e--Wus4
Message-ID: <CANNYZj-mxrjMaSEb4KaK9ZoTucPf6Ths5NGDMatuNyUb_38-jA@mail.gmail.com>
Subject: Re: [docs] thoughts on a refactored "Use Git to Clone bitbake-setup" section
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 16:17:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8094

On Wed, 19 Nov 2025 at 17:04, Robert P. J. Day via
lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
wrote:
>   it starts with telling the reader to "git clone" the bitbake
> repository (which supplies the bitbake-setup command) but,
> importantly, it makes it clear that they can clone it anywhere they
> want, after which they will extend their search PATH with the location
> of bitbake-setup so that that command can be called from wherever they
> are, and here's why that's important:
>
>   it's because that command is location-dependent and since it can be
> called from any number of current working directories, it needs to be
> on your search path. and why is it location dependent? because, by
> default, it does its processing in your current working directory
> (something that will affect all of the subsequent commands).
>
>   and that (short) section could end with the reader, after setting
> all that up, demonstrating that by 'cd'ing to different directories
> and running:
>
>   $ bitbake-setup settings list
>
> to see how the output changes.  that's it for that section -- just
> setting up the command and making sure the reader truly understands
> how it is affected by the current working directory. the *next*
> section can then get into "init", and settings defaults and so on, but
> the above is critical for the reader to understand.
>
>   thoughts?

My thought is that this is too pedantic, and needlessly complicates
matters. You do not need to put bitbake-setup in PATH, you can just
call it with the full path, and you do not need to educate users on
minute details of settings before they even get started. They want to
get to a build as quickly as possible, not to get bored reading the
docs.

Alex

