Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217F4C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 11:32:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.8653.1647603173460410314
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 04:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fJHWiJVB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 o7-20020a05600c4fc700b0038c87edc21eso786320wmq.0
        for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 04:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=xcyZBjdLUlOn2sDYGmYlru5wml5Su4ubXxZPqtTf+tI=;
        b=fJHWiJVBpmQBgqzhEBiRyHoP89eq2RBn/yS9JF1lmyW9JRmKAepXT69wp6wTTyT1j0
         fQwQTsVmBQ38poAuiNS2109cwhgbCut3M/ug6pps1OmjhuJng/NLAlDcE+bvojofTn/l
         YYF0V6j+sd8bB5oYjnGsTKVDkfSNlqngGZSzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xcyZBjdLUlOn2sDYGmYlru5wml5Su4ubXxZPqtTf+tI=;
        b=aa1jINuNxoqdsg/wSuhH77oEAzqay81wxPKmJJYKW5zyX8n478A/2aiA6Ge55s1gcu
         Z3zQ1oyv/AsvqlZQUExelPwSxH8gw8ydSiH9uZcPEOAmIYLkgaqjaNViFbNdxjxcIEoF
         kjNQk9lUCICG2kZkM8CkyGrIfRVs5fijgzgqcbim8uZRky6wOBIpXxYHUUJu60ZXfRdc
         uko/e4unaEMX5J01CG66Y1oKC2URaFAWX+gVz9unWVT3Y29Do4agGsc77bClHkcLafgM
         lDf1ZztF+CuYhhf8bDPPKtGAAbdSLP27wjsdtnLFBV1THRtfpS0LJK1AfeJoMNRYVh3m
         bNtA==
X-Gm-Message-State: AOAM533G7Ag2hy2l8Mc037BqqzmyM6dH0Eq9os8gWBIgG+8/ZUbnOmbb
	l08Fbc0u9wyutM0WwaO0Sy2H/g==
X-Google-Smtp-Source: 
 ABdhPJwUlABCdeErsgod6CPke/954HcadizTeFeJ4CXLS57tf6iT1Boa70tDNA3vRXOqZQFoFnW3Fg==
X-Received: by 2002:a05:600c:1c87:b0:389:9dda:af17 with SMTP id
 k7-20020a05600c1c8700b003899ddaaf17mr15384011wms.27.1647603171885;
        Fri, 18 Mar 2022 04:32:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac92:797e:3dcd:ed37?
 ([2001:8b0:aba:5f3c:ac92:797e:3dcd:ed37])
        by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c155100b0038c83236f92sm3113771wmg.10.2022.03.18.04.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 04:32:51 -0700 (PDT)
Message-ID: 
 <b2460d816ec5543f094fdf183dcbd889d8861502.camel@linuxfoundation.org>
Subject: Re: [docs] Version bump before release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 michael.opdenacker@bootlin.com, Quentin Schulz <foss+yocto@0leil.net>,
 docs@lists.yoctoproject.org, Michael Halstead
 <mhalstead@linuxfoundation.org>
Date: Fri, 18 Mar 2022 11:32:49 +0000
In-Reply-To: <a94451a0-8a13-930b-655a-8e3b34324cd4@theobroma-systems.com>
References: 
	<CADfgfobCTXyBYSSjekdKJp4ekrmHWH+imjpARMrCMLp2gwTr5w@mail.gmail.com>
	 <14D40357-15CC-46D2-B63A-66AED89F291F@0leil.net>
	 <6342c148-7e51-df83-2166-e2745b9f61e0@bootlin.com>
	 <a94451a0-8a13-930b-655a-8e3b34324cd4@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 11:32:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2625

I know I've been a bit against having magic versions as the tag information may
not always be present in a git checkout of the docs. That said, I was curious to
see how close we could get the information with and without tag information.
I've included a script below which tries to use any branch/tag information
available to guess the correct release series and version to use.

We can make sure the tag information is there for docs builds on our
infrastructure so that bit is easy. The question is therefore whether this does
generate good enough information for people with local checkouts?

The objective here would be to automate generation of the version information in
the docs so we don't have to manually update it other than adding new release
series mappings to master.

See what you think of the script/idea.

I've just realised we could detect the missing tags and tell the user to fetch
them before building too. That would solve most of my worries I think?

Cheers,

Richard



#!/usr/bin/env python3

import subprocess
import collections
import sys

devbranch = "langdale"

release_series = collections.OrderedDict()
release_series["langdale"] = "4.1"
release_series["kirkstone"] = "4.0"
release_series["honister"] = "3.4"
release_series["hardknott"] = "3.3"
release_series["gatesgarth"] = "3.2"
release_series["dunfell"] = "3.1"

ourversion = None
ourseries = None
ourbranch = None

# Try and figure out what we are
tags = subprocess.run(["git", "tag", "--points-at", "HEAD"], capture_output=True, text=True).stdout
for t in tags.split():
    if t.startswith("yocto-"):
        ourversion = t[6:]

if ourversion:
    components = ourversion.split(".")
    baseversion = components[0] + "." + components[1]
    for i in release_series:
        if release_series[i] == baseversion:
            ourseries = i
            ourbranch = i
else:
    branch = subprocess.run(["git", "branch", "--show-current"], capture_output=True, text=True).stdout.strip()
    ourbranch = branch
    if branch == "master":
        ourseries = devbranch
    elif branch in release_series:
        ourseries = branch
    else:
        sys.exit("Unknown series for branch %s" % branch)

    previoustags = subprocess.run(["git", "tag", "--merged", "HEAD"], capture_output=True, text=True).stdout
    previoustags = [t[6:] for t in previoustags.split() if t.startswith("yocto-" + release_series[ourseries])]
    futuretags = subprocess.run(["git", "tag", "--merged", ourbranch], capture_output=True, text=True).stdout
    futuretags = [t[6:] for t in futuretags.split() if t.startswith("yocto-" + release_series[ourseries])]

    if len(previoustags) != len(futuretags):
        ourversion = previoustags[-1] + ".999"
    else:
        ourversion = release_series[ourseries] + ".999"

print("Version calculated to be %s" % ourversion)
print("Release series calculated to be %s" % ourseries)



