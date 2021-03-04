Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.5216.1614859100946339707
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 03:58:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=o0O5UF1l;
 spf=pass (domain: linaro.org, ip: 209.85.218.43, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f43.google.com with SMTP id w17so928771ejc.6
        for <docs@lists.yoctoproject.org>; Thu, 04 Mar 2021 03:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jYY07vrgRK8oye7SHsqc4vOC41fuvhWkREIQzG+6Sgc=;
        b=o0O5UF1lNz6qYBIHGX30+KwVsOVsdtM4ck/2MZWxHxcelAcx++Os/EEqDibbAsBJNz
         Um4kwCDbTWfGNq+OlMtYo+hxp9xLjWq+kJ3jtZFASaAzYP3SJw0qIv4VvS/ZZiU6tSZY
         HKEis0rYmmByIcCsA34skHsIpUj6eMq655UNVM6NO6qf4qGNhqTxu4Nc7R9IfbT4M57h
         xnVuf1lFYvFO71e0RDn/YtdKZ95CFRtDS3KRnK81LAFQdOq2yVcRnyRrXbIToikBS/Hy
         weYo4mn/9evEdgowbDfZtfgJI0LelOMXFUcnytqaxnHPF5aJEqpEDpoYkaxp//C7K18p
         3z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jYY07vrgRK8oye7SHsqc4vOC41fuvhWkREIQzG+6Sgc=;
        b=jXbw7WugEqryQ8Kt7uoetJuVWw6Go0VMg8ntDVyOgwU+0oVe/6No3mAV3ZABzyFEZi
         w5WOiaa20zv1CWJTYJxR5Zc153+0Wpk1XCXwM8U39RZyUGApgSw5FuYU0CZD27uDdb8a
         nNrn4JeH/vMhJES59YyPBSfVxqzPY0LCAL6Zu89m77+6GDrJe86mG7a5DH9+Kgy/VtfB
         R72tf1iasA411b64VqYyZCc/kTSU2FnjaJyOzxLVYD/WAUkWU/XYFTETz4laOjHdSOZm
         QJTjnWI+rr+Xc66JSYYLHG653FZPFNPxgzHozoLRmq6Jtgi+Yj1RrveCUMwZvQJA6b49
         Ak7Q==
X-Gm-Message-State: AOAM531UltRTWc/edo3awcLPi0GborM0GCorMzKqc0n/k0mTX49muXpx
	X1QaLklrEa4La6mmIZPIuXKe5Fygh8u7Ed7/3c5RiA==
X-Google-Smtp-Source: ABdhPJzugPntB01N/qKXWO6fzCvkLFFYSlQE1DqWCh0wg5OacrS5pvm+i39Z+ccptBePD9SoSHwuQbfv79YS838G/JU=
X-Received: by 2002:a17:906:fc1c:: with SMTP id ov28mr3828426ejb.342.1614859099289;
 Thu, 04 Mar 2021 03:58:19 -0800 (PST)
MIME-Version: 1.0
References: <5bc0c0d6-10c6-c264-8026-ac7997d20e0e@gillesmaire.com>
In-Reply-To: <5bc0c0d6-10c6-c264-8026-ac7997d20e0e@gillesmaire.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 4 Mar 2021 12:58:08 +0100
Message-ID: <CAP71WjwWKREMD2ZsUBSHU8nPOrHFvq_cJDmwP22QDdA=tb8erA@mail.gmail.com>
Subject: Re: [docs] bitbake user manual
To: Gilles Maire <gilles@gillesmaire.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

hey,


On Thu, Mar 4, 2021 at 9:04 AM Gilles Maire <gilles@gillesmaire.com> wrote:
>
>
>  Hello
>
>  in 6.4 chapter under 9 point Creating a layer
>
>
>  BBPATH .= ":${LAYERDIR}"
>  BBFILES += "${LAYERDIR}/\*.bb"
>  BBFILE_COLLECTIONS += "mylayer"
> `BBFILE_PATTERN_mylayer := "^${LAYERDIR_RE}/"
>
> from the bitbake user manual chpater 6
>
> You have to suppress the `at begining of the last lines ..

You are correct. Would you want to try sending out a patch for that?

>
> I tested the example after correction with the bitbake installed from poky and got these results :
>
> WARNING: Layer mylayer should set LAYERSERIES_COMPAT_mylayer in its conf/layer.conf file to list the core layer names it is compatible with
>  Loading cache: 100% |                                                                                                                                                                   | ETA:  --:--:--
> Loaded 0 entries from dependency cache.
> WARNING: No bb files in default matched BBFILE_PATTERN_mylayer '^/home/gilles/mylayer/'
> ERROR: Nothing PROVIDES 'printhello'
>
> Summary: There were 2 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
>
> Sd you see why ?
>
> Thanks
>
>
>
> 
>
