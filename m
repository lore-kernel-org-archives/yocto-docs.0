Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D568BD2D8F5
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 10:44:18 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7674.1769510651341727511
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 02:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fZO640V7;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-502b698e510so67963301cf.0
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 02:44:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769510650; cv=none;
        d=google.com; s=arc-20240605;
        b=BpY+Tt9sckZUnMXpJloWkipr0QFjM7R8FdLxSmuJgzA9CIeNt5G0bVKEOF2OqWkfOd
         kh6vWI/uoSfh06AzOvcTLcHvyUVEfeRUxqdhpgIbaipPJc9J8ndgZzlomFJj1Gi7ryhP
         918rK80ONdeuDXLxkQzR3BrsmeWH7YXbnT+ZVQ+QqMA79ukLuytTWHhYp0znwuYRvdBC
         qtK781wzYM9UyvWDitHzXV3zZblVoo4yjwnxBFYytXe0bNbfPHc9Ck575e4qR4WepO0r
         gK/jMo2IGb9vjNs96ZpruYT2lQsFqFZeptLWVLYed4W/LXW/HtDCb4NnaVR0qNJTs5Dc
         PwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O1dRrqSjAfpuALSlYBmNstyRYp69oeSQCakXU844s4M=;
        fh=IwQa6llj6H8XIEVIz4lWmVmipWZ4hGf3oeW4EEUchq4=;
        b=g1s2bh7cMxlWpmdioKlpzJbRUCvjZnYn3b+QUVvB7sS6IOwm7JatYNYc/k+Lzy/Y/d
         3GTLxWYoDrb213vJO69DpwUEm4d2NDoyRGUDOeak/bVVBspKCCL/81wmwbXOYrp1kohC
         hSfSASMXiV0plPCyODkW+dbrP4HwBnqSMKEw5klNrmvsGmYoUtE9U4S/l8ULQLAgEJwa
         +Wjt8w3yz5uLYqKwjlW9b3b/zQGcciB4FC8ScL4q8lJ2SvZJRC3UrlFxYKIdJ74E5Jxb
         Yc+IfvnDyJVmAfTN2xa+EHFKqBpqkNW/57CFlxR1D1kpvuGPrsKnCzCmLjcbidw04hHn
         BNdQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769510650; x=1770115450; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O1dRrqSjAfpuALSlYBmNstyRYp69oeSQCakXU844s4M=;
        b=fZO640V7ij34yZcH6ZCQ6wXdVFUg6ZYPAQLrIW1IE5wCMVETUZ2mtdHflhE8M98JXe
         BJyJIyVQe5CMuxkhXSGIDvGTdRAsBP638MHl47x2Dm3Kks1iMhJOyVnEOblpW+XibLWY
         IvjBCM8fcWYCsEWI8Cr6snjWbwRpglK1eOvOQlE/FZqU5I0qAowUMkT2pXmW32fd9W7Y
         7JzlA/B7NZhODg9WvCmdpoWEHnA4Z+PVoMi/qfVcnXJtQFVeOYSjDtDC/dETYwoFDktp
         lgfZXLkW/MJIt2uvq5uao9zSc2gAu1RayxZXjRlem7G0rsZgzLplnqjVDbGYQvYiEqIn
         KNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510650; x=1770115450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1dRrqSjAfpuALSlYBmNstyRYp69oeSQCakXU844s4M=;
        b=DtlkfAi75Li+OHVbYVVAuBGbeCMEG9phB0LRiPhSz31o/KAD/AcwnsnjTPa9BPleii
         ietGb5RwAd6JbZ30F24YVFwQ0U4VBZTpIzESvru1fEoZ6JMla1jJhjN+1zoCmXTb/otN
         RevmxEs3IIFzgsBL5lDss0UQIGW56peAYFE7vhJU+lxHh/ra0HASIUd07Az6FYoKRoNq
         0eQm3VUOiXkfHJcO3qTEK+/4rwzGl4L/BPq/7LJ1xe9PPuO2epbKbmKnH2Ayyxgf89zo
         zx265h0vc86slCd1v56eaNo2ofZ7+BhOPaES+4HT3VKaFC/uf1jnlnRdKcZ5Yzsg1m51
         fUiA==
X-Forwarded-Encrypted: i=1; AJvYcCV8WqcCCpfbGMogElbE4FJs/QjAXs49Y2K3QDwWRqdbhwGFlNZT7NpoeTR+FxVQnLsWst5+@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwgDARtZBmxynwEAaPeo2lD9hhEuMlgNJpOhCYCiRw00Tbh8jRK
	fA6v/5dlTpvB/sPX53M8/96wPdrsUeBHS2d7R2f+QsZkT3KZ7VOsfpalWnRYCclRtARsV1CQ8SA
	2jmwovt6a4mrtmAiGZx8xMGx4Zka4bPo=
X-Gm-Gg: AZuq6aKoPC6g2x2ufQQg9siIcOYrpRwQ8/khEaA6HGr7s9+QMDOH77o9rleGZLPCofe
	vC96VraxQ8yOza+CEzOcLc4y8f742U/T9bN055EqsXachlSFU4TpND5wrQcsuQuCT5RMJE7Nnjv
	NeK//MqaIUuPOj4B4eY1HY9z7vV3yU39BNvEtnNsTgMsjPoz+rI2wVEeB+Ogihk3OS6JFxvTqT/
	At0lMvbSgBeiYqGtxTVjcXxvK1A1QOpjLnNuEfa9HasE4WuhwAqdk2qo4TZ+iqdSuzDfkywYKeI
	EsmAIHfqOYDERJ8aBo9t/BZPOTpp/j6VilSE2uUM
X-Received: by 2002:ac8:5f52:0:b0:502:f7d2:23f9 with SMTP id
 d75a77b69052e-5032fc19eb2mr10597301cf.83.1769510650394; Tue, 27 Jan 2026
 02:44:10 -0800 (PST)
MIME-Version: 1.0
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
 <20260126222743.411405-3-daiane.angolini@foundries.io> <DFZAUOEWOS1H.14T46F1J7RX3A@bootlin.com>
In-Reply-To: <DFZAUOEWOS1H.14T46F1J7RX3A@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Jan 2026 11:43:59 +0100
X-Gm-Features: AZwV_Qi7AwNMO2JU4xfOIC3doHvf-w38HfMZCMiXEpdPDu-IHFgQZfTmeoPS-Mk
Message-ID: <CANNYZj8-_0eiZpzYqH3Rw-kzjoB5jd873coJ-saO5hkDNwUCKw@mail.gmail.com>
Subject: Re: [docs][PATCH 3/5] docs: Fix leading text for bitbake-setup init
To: antonin.godard@bootlin.com
Cc: daiane.angolini@foundries.io, bitbake-devel@lists.openembedded.org, 
	docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 10:44:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8726

On Tue, 27 Jan 2026 at 11:29, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> > -#. With the default choices, the ``bitbake-setup init`` command creates the
> > +#. One example of ``bitbake-setup init`` possible command creates the
> >     following files and directories::

"One example of 'bitbake-setup init' possible command creates ...' is
very clumsy.

Better:
Here is a example of a directory/file tree structure created by
'bitbake-setup init'

Alex

