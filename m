Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE93D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:30:15 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5343.1768912213006705783
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 04:30:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FSWNNa2V;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50146483bf9so68245951cf.3
        for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 04:30:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768912212; cv=none;
        d=google.com; s=arc-20240605;
        b=g5oytvC0NdAGTX0hfhken8XDZESPOSIVlDKPrJrZv2eFDs5ruse/H3WG1oi+H/t80p
         7dej6000h+T91G1cuhpX/y0PJbLCbbUM/4xXW5PtiCIrPFmzyG0enShzWxRDtZ4MQjJV
         qNJcq1RX4EeEySuwL2pRTpQ/AsodjRaAqpEwqk+TvgAM3z2W1n2Bcu4mTjNM4nFfMjyE
         ATFXlBJMQwS+AOKV+QfCRaWTgv9R06L6Yv2FCOFuxVW+ouTciQK/No21WtNvScYl472i
         WMrU7ck0WBpeAwDyrTisZtr2oABdax/lkkG2iy1bTIlSnrPyeKwY5rs2c6fZCLI6yik8
         d7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PCJ5T7ag3jbSpx9QhjbrskqjHdUXn231fp7T6BGJR9M=;
        fh=CMMrKxE/kC1GMe3YesidT7x81x4tNV040Ty0mYzf6NM=;
        b=NMOeQxbujGUxN+FUAYMXhC+1SKbZBmQ6Lkn9CqGYyTxmwFh6kdmto8+uvKpGFqbbnn
         pwLATeACXm2glidrVWqdyMmnsNM3Vvu89D86jiy1EL0zGelJonmsJGcCCvWtVVFKIuuL
         Wvjx0VReP/IIpbsCGEaWZzzlUrKJm5KMaz+NEMC9PxGJb8m9BWOev3JmSJu4P/GQ995X
         HiBRIxqOKwbdNCGROg0n8sETdMw66biD4yP2wRzRnis/3wckb3K8U5GOuA0G3gvX7tqb
         AOvC4eOPb5WW7Li1uLNjjH9POlQxJaCM3fZfslTSYnwQDKw1C6GrCQSK3kIfYS+eTmK5
         9lvg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768912212; x=1769517012; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PCJ5T7ag3jbSpx9QhjbrskqjHdUXn231fp7T6BGJR9M=;
        b=FSWNNa2V1DcDkIid0tWar23L5FXwDqarx84dPjDk00wI3JYBKjgpq3YdxNfftJo9L+
         0ICCt1W8Eq7wnCtW+x03PmYckGLLV4LojiawqtYvgzeFWQnaJL7cC/pOMQTpcZTUa+IM
         msKXclsn9d4xMVmScyV3Du3Eax5jdKb93igZCb1IrtnUkSx9lx2cC4ziPjuThHpGYeuD
         Jr/P7Z1pw600rYFYyOhMBKlMiGZb4gNsivGHNMVhC4u7Q/DlfwEnT9zete+8lz15NNlr
         HnLxFAG3KO9D99jWQn6FUJec3TAFf+wflZaUfHSd16YK2fnj30327O4y60QCxWy3kufj
         PXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912212; x=1769517012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCJ5T7ag3jbSpx9QhjbrskqjHdUXn231fp7T6BGJR9M=;
        b=aa5ck4IRoR/oU/n0ajLJFWc6cJisxQQCcS9I/ZVIl6Ts8vFw71K28NoeUygILLCCXM
         XvUAFhgVBtAPsJ4W9ES1PZGOFhJz5uvuMqrwS9KFSXQdjp34UERtWsqxtKYqf3nLi5yn
         e/LdkjrzYIvYfh/qRV2OGmsJhBgh5CSB/MQdCSnCNnAtalnfSr7raINbUCDdc7N0mhkm
         gqEUwwHsSaouU2RysJYoIlvQyl3X46RpwWoKt+UwJytf8jOTn8THJ0LXstcPQUyvXPIR
         aVXYNYce/AtigEoRTK7HlpxfSGCmId8XslkU7mpefq0LJomwLwr8ztff270fE6pFZcKU
         aKeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQBLDamzAOB68vuowMb9nXKllkNVvR9nlYHehVhPPxwp64Vs0cekGyPixbe8YVsBmx1LQ3@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwxNWA3fhqM7HEGPTU1aSaJ4JTg8nw/37P43oNjmGyCiItHvfEb
	Uk3wuDEySYGravwATNKvi62MwSfFnqWVtsos80tBCCK/CHX/76txRd8iQ1iOtqPhvZ4OJe6hsVe
	3lWTu+C7wIKzqatIXU0D03h6ufIQpPd0=
X-Gm-Gg: AY/fxX4erSbDZAxs1BqvQrqhj8PaGGi5xi14/n6rp4dQHpg9cVKuBzYO2FRJUyMSavV
	Dpn7hAmgQGeDsx9jq+rEzK0uhyjnEJUyRTdjXm6U0RJlqELejB93VHbIDJCvZ1/eY6hpPTGTJup
	Aa9VgfsNe+0crXQuxT3Z8fFzyW5d9psrx7Oy9zUaqZS7545pELBQdBEguV3jV/4daRsNg5Qh98c
	Jgcwn8qEbMOomx1LVFPHBDhamR0x0f4Us6TWfu9BXvZMdu8ulw+PuKJvaVdHHTkoHQVMPHIT9yr
	jdI6bzj9JO1OfzlkbRNPRFB11xjx6w==
X-Received: by 2002:ac8:5f49:0:b0:502:a3b:f367 with SMTP id
 d75a77b69052e-502a16b31f7mr204203831cf.51.1768912211918; Tue, 20 Jan 2026
 04:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20260120-bitbake-setup-choose-builtin-v2-0-ade604ff2351@bootlin.com>
 <20260120-bitbake-setup-choose-builtin-v2-1-ade604ff2351@bootlin.com>
In-Reply-To: <20260120-bitbake-setup-choose-builtin-v2-1-ade604ff2351@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Jan 2026 13:29:59 +0100
X-Gm-Features: AZwV_QjPGyE57kOsd0jehxyog_-Y-324e5duPToIWVlyOP4S5MCZi9Pp1yL8oL4
Message-ID: <CANNYZj_U61ArCom7N0+8ztW3gP5t+6MRHUyj7mV5PQ6VR0Vf8w@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH v2 1/2] bin/bitbake-setup: add
 descriptions for fragment choices
To: antonin.godard@bootlin.com
Cc: bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 12:30:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8589

On Tue, 20 Jan 2026 at 09:57, Antonin Godard via
lists.openembedded.org
<antonin.godard=bootlin.com@lists.openembedded.org> wrote:
> -        choice = [o for o in v["options"] if o in parameters]
> +
> +        # options can be a list of strings or a list of dicts
> +        options = v["options"]
> +        descriptions = []
> +        if len(options) > 0 and isinstance(v["options"][0], dict):
> +            descriptions = [o["description"] for o in options]
> +            options = [o["name"] for o in options]

I think descriptions should not be a separate variable, just use list
comprehension to build up a full structure with empty descriptions:

if len(options) > 0 and isinstance(v["options"][0], str):
    options = [{'name':o, 'description':"" for o in v["options"]]
else:
    options = v["options"]

That requires tweaking the rest of the code that accesses options, but
I think the result will be cleaner, e.g. adjust:

> +        choice = [o for o in options if o in parameters]

to
choice = [o['name'] for o in options if o['name'] in parameters]

Alex

