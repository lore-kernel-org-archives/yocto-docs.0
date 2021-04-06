Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.1162.1617745004056294654
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 14:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N/BmW++A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id f12so9716410wro.0
        for <docs@lists.yoctoproject.org>; Tue, 06 Apr 2021 14:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iCzNTa+ZkliQMWtG4znFH8DDLodS0LwdEDlQWBnYBOg=;
        b=N/BmW++Ap1DPv8RjsxOICLFkwtvXpNTJcWoVL+W+AqRcBkFSKXdTYC8r9EhaAiJ6O+
         dOA8XUiiKqcQSe81Or0AHj2UaoESJ6zZtw+mk35SCqTH1kwFGed3zpZsHaPVlFYiv66M
         RWJdai9GPJp71KWrECUL4HdeBKpnvc605D/jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iCzNTa+ZkliQMWtG4znFH8DDLodS0LwdEDlQWBnYBOg=;
        b=RhKapAeApQ1R+BXX/Dd+MmgBZ6xLF4qPJSUHHV7U1Oanlnp90J6JA94KJ9i0bnEnWu
         qHmPK2Rpk/P/m6vGFUAWZkvlisYiW9Cf+4m4Wsd8Qd/wkVvpgxDm4ArbCgQSctec6SUp
         D7Flf8Pv0Rmk4zJ3aAV4ZRVbhzMmxUCqwaf59lEFLw6KmCiFqQMmbuF70gy/PcsaCLkg
         nBVuo2ive/OEcC3AaPTnGugCQq048E/SQqL9kjPuU8gdgvACvmo1lB9/bv0A0n5zSX5c
         RJuBo5v1sBfGaxu/ZXTnvAGMbdCrOTfAOiXU+68jkrwhX11zZIhEtO7iPW88mAaO1feF
         cKRQ==
X-Gm-Message-State: AOAM531h7zHFraGa132zt3RQZ59kZPtq7X2hamdRohByFJRL323vPO+t
	WQ3OD+jVZ+1dXVUlCbhO+vDM/A==
X-Google-Smtp-Source: ABdhPJx21vWcZxrmjSwuPhsYgSphFzLdiLx05/DIZmdQ4CNbAAVw17Fx5X0SVGHhmP1FdK3CifEJ+A==
X-Received: by 2002:a05:6000:2c8:: with SMTP id o8mr273793wry.407.1617745002461;
        Tue, 06 Apr 2021 14:36:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:82e4:10af:e1ba:c8de? ([2001:8b0:aba:5f3c:82e4:10af:e1ba:c8de])
        by smtp.gmail.com with ESMTPSA id p14sm4361072wmc.30.2021.04.06.14.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 14:36:42 -0700 (PDT)
Message-ID: <6acad11074eda38fc1cca3c6f128a702d10d9522.camel@linuxfoundation.org>
Subject: Re: [master-next] Pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Tue, 06 Apr 2021 22:36:34 +0100
In-Reply-To: <03e26f4b-2dfe-33a2-3eea-607a0f088cc0@bootlin.com>
References: <03e26f4b-2dfe-33a2-3eea-607a0f088cc0@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-04-06 at 22:56 +0200, Michael Opdenacker wrote:
> Hi Richard,
> 
> The following changes since commit 5036fea7854c3152a0c148d8ab1668e01b38697d:
> 
>   poky.yaml: change gcc-multilib to gcc (2021-04-06 15:07:42 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.yoctoproject.org/yocto-docs master-next
>   http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next
> 
> for you to fetch changes up to 67d5fb17f31292abb1e2dec7e436a7d8a534e63d:
> 
>   manuals: fix suspicious newlines (2021-04-06 22:18:03 +0200)
> 
> ----------------------------------------------------------------
> Janne Kiiskila (1):
>       UBUNTU sudo apt git instead of git-core
> 
> Michael Opdenacker (7):
>       Spellcheck and capitalization fixes
>       SDK manual: fix reference to appendix
>       Quick build: checkout a branch instead of a fixed tag
>       Fix typos and spacing
>       overview-manual: style improvements
>       ref-manual: fix typo
>       manuals: fix suspicious newlines

Thanks, the commits themselves look good, the commit messages needed
a little tweaking. There was a Signed-off-by line that went missing. I
added it back since it was in the on-list version of the patch. I also
tweaked the shortlogs a little so they were more consistent. I tend to
do this with patches as a maintainer just to have some kind of consistency
when people search repositories.

No need to redo this pull request as I've tweaked it (I want to get to a
release build!), just info for next time! :)

Cheers,

Richard

