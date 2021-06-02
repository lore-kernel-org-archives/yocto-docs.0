Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.454.1622674269042853958
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Jun 2021 15:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QbulBQ6+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id z17so3828788wrq.7
        for <docs@lists.yoctoproject.org>; Wed, 02 Jun 2021 15:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=im+sDCxHFDC0PelH9Xav7cQYRO9NvIiEJX0LTULWPv4=;
        b=QbulBQ6+i3fQcnE/GPT4cYv7PI8KDKvT9vgDx6Iy0GOdR4/4iwcC0rIgLckZ8bT8Bs
         1iIsciH5SeMoRptEmVOnPSw8znqabnwnDccx+sXHL24WdgsP2LYTX3UTJzh8P+BQT+yO
         wd6SjwL3IZOD1Gq+as9g9PdCT2w4U/o5jCxDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=im+sDCxHFDC0PelH9Xav7cQYRO9NvIiEJX0LTULWPv4=;
        b=uIRBNTQ+zSS2FcoUgnu2YNOBE8LuI2t799crsAaUGp6+o9sFL9vQyjYaXgbYxUXQlQ
         rYTe5INUPHcCiRtn28azzb2Mym2RHk6MEkAvG9Avv7StvAiI6/hpa9LQgQttBYQBS5Rv
         gYzfou+vJ2cdVb/QNmzJCK4AMpEFuj/orjLiW5kQk8VZdGFv+Wo/39yTRnRYtP9g/kfj
         hlsUChlMYIOfVaPDyK+nTG10Ay7wQfJ8yhUZYiRE5J/2dMAGq1Dpqfkrr30cYaCJkBOp
         fBmwWYz+ISXZrn1UPLT2l1pQVnDeHmBhHJ2pceqIenJZBtVivW8IMI4cVi88qYzj1ZUm
         Q50A==
X-Gm-Message-State: AOAM5339INNI1/3H5UzNKqrk0r+NUYN5kIlscv70u9bNVqVAJY8KwNgG
	3peDpsWU7SI/CVeZG2ujA2AekA==
X-Google-Smtp-Source: ABdhPJxLrXZfydOrdAMFDmGrTwMnyU5++XsEV/zLJZ6cyMVL1+kjulZ+56evmuUsr6sw01eLU0X7LA==
X-Received: by 2002:a5d:5182:: with SMTP id k2mr4654086wrv.381.1622674267360;
        Wed, 02 Jun 2021 15:51:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:aa71:4934:cc48:7546? ([2001:8b0:aba:5f3c:aa71:4934:cc48:7546])
        by smtp.gmail.com with ESMTPSA id v8sm1418648wrc.29.2021.06.02.15.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 15:51:07 -0700 (PDT)
Message-ID: <0f93f39b35a244acaaa11222fa080196dbc3b1dc.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] yocto-docs: remove obsolete documentation/tools/update-documentation-conf
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	docs@lists.yoctoproject.org
Date: Wed, 02 Jun 2021 23:51:06 +0100
In-Reply-To: <20210602150041.586679-1-michael.opdenacker@bootlin.com>
References: <20210602150041.586679-1-michael.opdenacker@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-06-02 at 17:00 +0200, Michael Opdenacker wrote:
> This script references old documentation files that no longer exist
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/tools/update-documentation-conf | 158 ------------------
>  1 file changed, 158 deletions(-)
>  delete mode 100644 documentation/tools/update-documentation-conf

You might want to think a little more about this script.

It takes the documentation.conf file from OE-Core and injected that data
into the glossary section of the manual (in xml format).

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/documentation.conf

Would we want to automate injecting that data into the sphinx glossary?

Cheers,

Richard

