Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C663C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 16:58:45 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.18628.1636736323907221563
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 08:58:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A907sXPq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id d24so16713410wra.0
        for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 08:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=S4uMjWTUkN98y5OxHuJTA31HsJj0VZT+KiA24WrK3/Q=;
        b=A907sXPqvhM1fJNeuSDEQXDiMH0LA1KgcgNSwKS/bQh+l0sunepPwAHtPkLszK0WhC
         ZHgJZC62Q4Odulz7oeLgsWGJ33fQB50fcvaE/Fqnv4f0gYtgD0IFisWo8WtfY1nZLs+i
         8a0t6HFhtk7806syS7V0oOY7v4Isn+3t+FRKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=S4uMjWTUkN98y5OxHuJTA31HsJj0VZT+KiA24WrK3/Q=;
        b=mhgsew3Hcb+tJTvI0Nvq2QfGDCBz5OcPJbwpstPzW0Ou7cgTHVfB+KLFUtxxb/VbqA
         amM5F4875sO1+e9tmzuPt3KBGPowVmYlzjcPEDJz2jDe7qplI0Prr6VMpKoVrRVq7QCU
         f+5sGAzIE+UHzlhpJXJbq54MyVglsQ+6xtpUxYucSmEGPvxTPx54md7G1/3s3v/NkuI+
         /8jfjGxSfpTNEXspovsOpNMWDcggTzlZYCizu8In5W2ZT/QJCk+DYYT2CBkPAs59/M+d
         QvyVYzrehU9PvYvTbXW+uD5WsSbBO0hnHKa1jH5wVnHH4eNrSEXFQCyO37+Zy1k9A+OO
         D8hg==
X-Gm-Message-State: AOAM533zgYSLgTjlNMCHSQ85jTP2MgbhkK87ad+JAmEIubirm9gb5yJi
	ht4P6x8OvWNfrA+PTtIJq5QKdQ==
X-Google-Smtp-Source: 
 ABdhPJzGsCgZuIW8fEropHS5Gu6gGC/TjcqO6ylT5+0HijJIHfk1mBfrxfF+BtDqgqAhu2TWibCqpw==
X-Received: by 2002:a5d:5888:: with SMTP id n8mr20319805wrf.234.1636736322445;
        Fri, 12 Nov 2021 08:58:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c0bd:72b4:105a:2914?
 ([2001:8b0:aba:5f3c:c0bd:72b4:105a:2914])
        by smtp.gmail.com with ESMTPSA id
 m14sm8887360wrp.28.2021.11.12.08.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 08:58:42 -0800 (PST)
Message-ID: 
 <8f1064b166e71dc88c99f702041a8f611929b9b5.camel@linuxfoundation.org>
Subject: Re: [docs] Why "git send-email -M -1" in our contributing
 instructions?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, YP docs mailing
 list <docs@lists.yoctoproject.org>
Date: Fri, 12 Nov 2021 16:58:41 +0000
In-Reply-To: <84ac62a4-4e20-5453-47eb-994be2e11511@bootlin.com>
References: <84ac62a4-4e20-5453-47eb-994be2e11511@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 16:58:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2142

On Fri, 2021-11-12 at 17:55 +0100, Michael Opdenacker wrote:
> Hi,
> 
> I've just sent a patch to the bitbake-devel and docs mailing lists using
> "git send-email -M -1", strictly following the contribution instructions.
> 
> However, my e-mail got sent twice. What's this "-M -1" option? I can't
> find it in the manual of "git send-email", and I had done without it so far.
> 
> I wonder if we could remove it from our guidelines for sending patches
> with "git send-email"...

It is possible it was confused with git format-patch which we definitely want -M
for? I agree we can probably drop it.

Cheers,

Richard


