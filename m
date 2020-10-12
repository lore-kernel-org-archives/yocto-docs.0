Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.2963.1602521071748882094
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Oct 2020 09:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CipGa8JI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id n6so19641571wrm.13
        for <docs@lists.yoctoproject.org>; Mon, 12 Oct 2020 09:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=BqrOUfrZ3/0Ezwlh1BpwgAZ1sJqebbaY6HYd53AJPhQ=;
        b=CipGa8JIIgCZQxdoFBVpdvnx3Bu9knFmnzCQL+LRy6iMS/m79oeA4zXb9u2KdcRJ76
         ruHFmTPVyDdw/XvHZBvJXHrQ7QlQIC1HDWsQZl9QEotrCSv3yTY67+BXlcaKwW/Rogep
         Wo4ZBfic8JV2FicqHxekMpf5mA56kvoFOE5Sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BqrOUfrZ3/0Ezwlh1BpwgAZ1sJqebbaY6HYd53AJPhQ=;
        b=j2ZKZAn0XhHm7pyiPez5dr6x7SSb1FjMddFFjy1zjlGg5YpUfFuMt48FsAUL7tf/bc
         7ozX7bjFkZmt3AjfkbQbBVCpe+GSHEpeX4CLn5SVWQ6gJBL9QnTs13EB0AEdfsGi8Inh
         upjHCX5MAWICfdRC2E5G2H1fLERiZ5PAPI4udwVY6qxkhpz5KXgcXxFGPTLc+siGKMZP
         GCBbeSY+zFV25FhmqVpCqMATGW2qfW4zWvBJwmqK5UkzqX/Uq4+4RaLQwN+hhr8vcHqa
         t7Flq8/w/IsoTXtwjnl2ve7XNqJzC4DESVeA33+gNNbgLV4MpyBP+uDR17njeh16psu4
         s5Og==
X-Gm-Message-State: AOAM5323o53nYp0KE3L4sT8NGR8jB2qIhLCMqVSgFXhwInUtKTv/Ohht
	qSPCCucPRn4fA/OmdMD4AfMHOA==
X-Google-Smtp-Source: ABdhPJw+N43GkehoQuanugGNAJQwXRuSpIdyDXeb1ixVRG6wy+CmvuvXp0GlB6YXfVozJv04Ja5DuQ==
X-Received: by 2002:adf:fc83:: with SMTP id g3mr1846168wrr.200.1602521070107;
        Mon, 12 Oct 2020 09:44:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id o3sm22202036wru.15.2020.10.12.09.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 09:44:29 -0700 (PDT)
Message-ID: <6a5d793b25c0c5d0baa21d8fcfdb8ff7986f4b3d.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] docs: Updated the status of spdx module.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster <akuster808@gmail.com>, leimaohui <leimaohui@cn.fujitsu.com>, 
	docs@lists.yoctoproject.org
Date: Mon, 12 Oct 2020 17:44:27 +0100
In-Reply-To: <906c0783-9cb6-0cd2-7bc2-ee73fc4d810f@gmail.com>
References: <20201012034255.2186713-1-leimaohui@cn.fujitsu.com>
	 <906c0783-9cb6-0cd2-7bc2-ee73fc4d810f@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-12 at 09:23 -0700, akuster wrote:
> 
> On 10/11/20 8:42 PM, leimaohui wrote:
> > - Deleted content about old spdx.bbclass.
> > - Added usage of meta-spdxscanner.
> 
> Do we want to go down this road? Will we be adding other scanning
> layers in YP docs?  It seems out of scope for the Yocto Project.

We do need to remove the spdx class from the docs since it was removed
from OE-Core. At request from members, we do host meta-spdxscanner, we
do support SPDX as a project and I think at least putting a pointer to
it in the docs is probably fine?

I make some minor tweaks to some of the language to make it more
consistent with the rest of the docs and put that patch in master-next
for further review.

Cheers,

Richard

