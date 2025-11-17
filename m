Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167D7CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 12:14:33 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7823.1763381666980640552
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 04:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Is/gALKM;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88057f5d041so42119466d6.1
        for <docs@lists.yoctoproject.org>; Mon, 17 Nov 2025 04:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763381666; x=1763986466; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n/6IiHb/SRwidpZR5HcRMSiLLGbFqrPBbU7wABedDbc=;
        b=Is/gALKMDDvIkbhgDKzTVdcshMXQyMOiiOIBYWSizfEtBbjVnyCwEEmeKjDCE/QpQO
         3ggzefc+rhie9C1V+gx2lH0iWE1W/eAuy3kB5BDOCRr077OgAVYm946h4WvnGJ+GP4YB
         HHlZ25S46V3UzYN47BErEB2l8hqxsnX3rbqJ3WhFHVL/auJw1xjYFjnclwSCLXcBEQ+J
         xbzlUa3Roxbdfl9ogmdCjSOcWqt5/j3F60mFJ4qEwVuK7aJdlT8CsX7yg2ZmKyrwQkXU
         aq4g/dAc5bvS+bKQCNbVRG2fYyYR+OaWpguA9xHxBVRUNbNXJKDRJ9X1bPZC4pk+6YRh
         Velg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763381666; x=1763986466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/6IiHb/SRwidpZR5HcRMSiLLGbFqrPBbU7wABedDbc=;
        b=nkoihHQ5a9M0f2jTzqSm/SuATVjWL/53TLAde2QzXkr3fTVsibYUmoh2G8XQ4ICGxh
         kqheC+h/+TcfZ+XxXxCxeYlA/pdGn3WnDZPNBJt8GLjus3SMFN85vYRZSoTDRMOi6CxY
         vt80PmcfcxQ5jLx1P/wEVle8r9YsXA+v08lFfpoTW9cfZfpsHRsSnJIn8M1d3anQwqX9
         aaDfJiE6v8ksdrIr26Tf7Sd6YYXRv+oqGJangFb7BcEXI8lOGctpkRHO+sbZJS4D2O8F
         v/9DbnzegsFGBi4ybuet1WNdtOHWLgDutx3m9iGmHaMgnany/ifPJm7RVt2AiqPd4kzH
         K73Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyBgTwdr/VHQ2rOq5L+YkNx58cxiy/roj3rDkrl5kSciD6ITxAvsi6Vy/Lj1oqK/fbwRlz@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz2TFIxsfRdUdq+Ho2HdeNK8z7CssqsepIiOHwKjfzlenrHcalP
	q2/xGpWEOaeeWUsVxPFo9J/q1xg8I4+nKQQz1v5EhwtP8yzP7VdTzsT6a8V2I7X8PcH6rhZCBjA
	2sHlXiiZCuMknTx6DulOxAjPEaQ3mM+k=
X-Gm-Gg: ASbGncuk0kxXXY+uWqANpr6EjLIoieSU9Z1jzkdKl/xj92NYMHHDMDKV2l3IEixFyAl
	UJikl2h5OgfGZpP8xK+45Izj9nl5EgkZMQN/n0zo7Kc55EsJ1aVpDEcnpIGFXJTP5OkDa3cTYyx
	bnuRBF64raEyFQzgPFmBqUA/Tjdfm6N0qGOwtugd04rwA5QBxn4xJUBWtI3B8mw23Beb4SPeFbb
	JPqEnByHB2W2cov3II3zYi97M5M3kSyi7xqMQ0gkY117cK1dleumGVX7WI6Dwe2KkrLGHDe9tmj
	8G0hGX0WEDMjKbNMvTbndxybAAIYLg==
X-Google-Smtp-Source: AGHT+IGt/tUWUovEH/gsnh8LwnCnfHyVCSOiGyWXmcmU6rnM0baXtV5Ng5++gVQ2oqWNdUjroxfzflAugosiv2Sg3ic=
X-Received: by 2002:a05:6214:19e2:b0:880:48c6:ad02 with SMTP id
 6a1803df08f44-88292699637mr200213856d6.52.1763381665955; Mon, 17 Nov 2025
 04:14:25 -0800 (PST)
MIME-Version: 1.0
References: <20251114-bitbake-setup-conf-updates-v1-0-990583d8251b@bootlin.com>
 <20251114-bitbake-setup-conf-updates-v1-2-990583d8251b@bootlin.com> <DEAYICIFFDWO.3R8QEGO7FSMBV@bootlin.com>
In-Reply-To: <DEAYICIFFDWO.3R8QEGO7FSMBV@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Nov 2025 13:14:14 +0100
X-Gm-Features: AWmQ_bncGK6BDdfP_C1-Xp8ceUWRc77mwUUzWgwBUx9_Un_TgbCFSNl-HcKxKwE
Message-ID: <CANNYZj9f+WDUSppAkUPHh3EsnUGVYJLV2S5AAMwAtE9PfQqLLQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/2] bitbake-selftest: setup: add test for --update-bb-conf=no
To: mathieu.dubois-briand@bootlin.com
Cc: antonin.godard@bootlin.com, bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Nov 2025 12:14:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8062

On Mon, 17 Nov 2025 at 13:08, Mathieu Dubois-Briand via
lists.yoctoproject.org
<mathieu.dubois-briand=bootlin.com@lists.yoctoproject.org> wrote:
> hashlib.file_digest was added in python 3.11, so this is failing on some
> supported distros:
>
> Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/bitbake/lib/bb/tests/setup.py", line 393, in test_setup
>     sums_before = _conf_chksum(f"{setuppath}/build/conf")
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/bitbake/lib/bb/tests/setup.py", line 373, in _conf_chksum
>     sum = os.path.basename(f) + '_' + hashlib.file_digest(fd, "sha256").hexdigest()
> AttributeError: module 'hashlib' has no attribute 'file_digest'
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2707
>
> Can you find some alternative?

I think it should be a simple change to read the file content, and
feed that into hashlib.

Alex

