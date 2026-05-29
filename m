Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA713CD6E49
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 16:40:20 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14706.1780072817239884226
 for <docs@lists.yoctoproject.org>;
 Fri, 29 May 2026 09:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SDaY2gmn;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8cce22e029cso14820766d6.0
        for <docs@lists.yoctoproject.org>; Fri, 29 May 2026 09:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780072816; cv=none;
        d=google.com; s=arc-20240605;
        b=cErX+F6yiKtKR87R+pOiJx7W2a4xJMIFAbl8DI/DUMIZBlMEpfnwcK05Zt/sWCGem9
         jsxrLFQSV2qkNTMLoyXejDGY+Ax+trVj23/uNL0Wc7ji6JNnqoYNBmtAx4po/iNJMf8A
         ORruqZ2ZjrCiF/mQyxwjrEPr2Rcux+Iip68XDm4RcKF/e0Hs8wtmD7JzmVWGjwkTJXRJ
         WJuQMvMVuC1ZmMj3JombjXHfnkWCLvaQP2L6Voy53JOOXJUDVhxQndcBfwZwVD3ufj8E
         HcTo2dQLdOa9YA0PsG74I6Ox2YvjAUovj23RBsIxiL5bLm38xBe2TLao9m9kqXBCZPw7
         33HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wR0SB/hEiSSnfKIZxAChsqad+NE59saPy9BVW12re/o=;
        fh=W+Gi1P4ZXVXVNsZDefEZCzxGWJ8UYRcq2Bpkd3WhGYk=;
        b=QT5Y0MCP/MU7HOnngjDadqdTlF/DImth9N2T2hZ1nSt36tRjhZMyhm95vYBvwvwDXy
         HvB4eNBuaAh+W4YPKaPecQ8teiM9MCn/w/JhzomYJHxX2B64K21eLIO4UhNNrnM62v5N
         Wxpkk1R1c1X0L/X9Iaupb5MwsSm+cG/TGu2vw6dEUGGSRbQQgGTDAWq3YdWLh4AgKrIp
         rTOW4NDetWr2Ac0dzoa7Gc1vDWKxDisUVljeNFppzTp/t6WfUeHE79kiPwfjMbJ3Uzlj
         PE9W2eODS9eviem+mWANpzyugrlRBo+tZUtUqIYp+DUMSb7DFzAaIqfiQwMwcm5HJT7U
         bUiQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780072816; x=1780677616; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wR0SB/hEiSSnfKIZxAChsqad+NE59saPy9BVW12re/o=;
        b=SDaY2gmnEGas2ggaf0TmQjZeil94mFjRcXafkCFUnM6YkLonls2MTVZ4/Kr9jJgfy1
         RsHL0AfhPxA3U9gzhfvTn2MiafukS16bYdgj7I/Pc8FrROGAiUEtaPxAPBAcQwfvyBPd
         dax1Lj8duL7fWwmwrXmg57ZHCIZ47j8k031tPQ+soU7IwG99l+b69YXuRmkgkMqh3oMI
         qeZjzFKpCqFsm4o8I4rQPDSLoGcSBtdidBMadT6qoOpotxflco7+Lqn1kxuaw1IYZGaS
         PZIFsyHo2JShAiPAxWmSWF7oH65xr5cbPAQY+pOuEkg3oZ8YO6vihw4H+df7EjGeVC2O
         vuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780072816; x=1780677616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wR0SB/hEiSSnfKIZxAChsqad+NE59saPy9BVW12re/o=;
        b=lJU3Uj34PIdTXdA4dVdaxtGUfohUNphQjUF/tIBy3wZ7UWhveWC0lTCRKt5Wskr+mS
         eG5hp0KokT1tufWJonq8QTeF8xpA+fhn7WyKsvYDgWhRIiNsR+N7W1dwecR8Lfg31ve/
         erDScgiGxmvJeUYILzQnaUmZntCloMNhxa6BOzdpEk+64KKP7fszYhD0R/LHsryKfrQH
         tr22M0zWxvSRq8Y40V2GP81r/oFATPF1Lp34bO9AncSFv3gsMgsrOXxFLH0g/q24RK7u
         xT8unnri+FdRlhtQPx7D3JcBb+PzPDZ1HBFo0FY8i6AZoIcbLPavsZfZ2Gn9Yqkxpm9x
         cClg==
X-Forwarded-Encrypted: i=1; AFNElJ9yLzgm6lRsnypihkm2mxzYzi4aMTPgO3EnyW+kbDsjFSd+VBrzfwMeZB/HEDnIrVdVQGBX@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyukYUzmtCxAMmC+9snQ4K96M7T0mO2JBVK1fCheCvghvqbtHoE
	HSVdpCPyF3I8Be/wU42Uy5qIiUXyGJdhziV7STABWQnRziz+4ysgQa8AQqD42+o2x7SnjZfEifz
	mvuinlA0QMW/bMnphSaAsWw4peOGdpsE=
X-Gm-Gg: Acq92OF/kDjKsmue9vDQA8bsDZ3Oli61A4xC88+JT3dd24yYQkbYiShtvE/F1KXam7G
	FrOkFj/Z2a8vuqQ3hre2SzE4oijCulcqBgjje+PP/YQ4Ewk1fikaXQ5FBtEPFZb28V9o3cWI3Jf
	4V8HGxjoeFqnWcuLE6n79SF/iF4B7bMu7t+DkG79SFkzUPDZ4s8luxkHp5TByErn1R6xXcsE0Gu
	iHooT66beo3GYHrRdOPwUlVGfkAcMbmYZwrZrljEs0JXtFHWLfnVwrmsApY9/qgRCiWfusx1Aeq
	4AJZC2pWXM8S8vl/ErgTXata+u37NSIdgBb3MfY5xoFUPYnIM83n
X-Received: by 2002:a05:6214:e42:b0:8cb:e814:67d3 with SMTP id
 6a1803df08f44-8cce4eefe3dmr44897446d6.24.1780072816187; Fri, 29 May 2026
 09:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-bb-setup-override-improvements-v1-0-91db62e0149e@toradex.com>
 <20260529-bb-setup-override-improvements-v1-2-91db62e0149e@toradex.com>
 <CANNYZj9FxhgKEfBu0M=1o7pc3RYZ67XdcpOyr5dEKTpmTAWYYg@mail.gmail.com> <tgfbutopbavkq6ehs2g62lkfpw7guzyfpucg46lj2p2j534f2b@aaiam4e7b4xf>
In-Reply-To: <tgfbutopbavkq6ehs2g62lkfpw7guzyfpucg46lj2p2j534f2b@aaiam4e7b4xf>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 May 2026 18:40:04 +0200
X-Gm-Features: AVHnY4IQKugjhMbaKSYPD3a8RdJcwZZVIEf_g5qP09877WhcAqzUMrVu-XtDanM
Message-ID: <CANNYZj-i+koZijvYCjCq74P+ArUW7Aq9kcpJ5j_afCyXKJyDow@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH 2/2] bitbake-setup: support default source overrides
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: bitbake-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 May 2026 16:40:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9542

On Fri, 29 May 2026 at 18:06, Ernest Van Hoecke
<ernestvanhoecke@gmail.com> wrote:

> Thanks for your feedback, I understand your concern and was not sure how
> to go about it for that reason.
>
> Yes, that's exactly the issue I'm facing. We would like to have a "dev"
> and "release" setup. My current idea was to have the "dev" setup be the
> default, with all revisions pointing to master/tip of the branch and use
> source-overrides to create a "release" without relying on users to pass
> it correctly.
>
> If users have to pass it on the CLI, it also creates an awkward
> bootstrapping where they first have to check out our registry locally
> before setting up the release build.
>
> And if revisions are tightly specified in the main conf.json, it's also
> less straight forward to update it with the current fixed-revisions
> system.

The overrides system was added for a different use case. We wanted to
support CI systems which need to set up a build from something like a
pull request, where one of the layers needs to come from a developer's
branch, but everything else should remain standard. Another use case,
added a bit later, was to write out fixed revisions override, so that
a build that was set up from a floating revision config, could be
reproduced exactly with specific revisions that were resolved at that
point.

I agree that supporting multiple sets of sources would be useful,
perhaps you could look into adding a "sources-overrides" section into
the json, which would contain multiple sets of overrides (e.g. 'dev',
'release', 'oldrelease'), and then the UI would allow selecting one
interactively or through command line? Unfortunately 'sources' itself
can't be extended like that.

Alex

