Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DABAC433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:14:54 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.37795.1634570093465310726
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 08:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cHs93eWI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id y3so42219515wrl.1
        for <docs@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 08:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Zk/nSw4opElXvtX48oy/l1fF1xhT1535AkhoxGAEOfA=;
        b=cHs93eWIRQIJ33/FA9f+byOPttRhz0Vcg0dl/Ygv6tTSiG1IAMjQSTUD0IrDovfzmb
         JRQvXtkIsstdz3TqFR6sVZf9xsBa7kBDjAqsEaFrcyfrPoso4MEK/XYIvVhCptnkmX/P
         BjwSTf7UxfKY2/BprIxTaTz2YIlXBw+ylJbts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Zk/nSw4opElXvtX48oy/l1fF1xhT1535AkhoxGAEOfA=;
        b=rP+GIVa339tvdazspoJLjiqcplUjUhIfCizd7lhrJjqct+7Oeo3ehuYNsimHR+km5Z
         0VBYcefWf9qqV3h1CCePzXUtnuFUP9PVpvlUKNa7Jwc6yj1IYIvJQuGyn4YimgTDMYQV
         FVHPXRN8YfEDRoU1S+lA1AeefYd/wu3SsSW1lKDGin7WUhee9OJUNBUKeYMLUL8HxH1i
         N3dM+dKkjkx4FYkT24Bdc+8KfFaWo9djyuobOMmn05RCjR73f5ETiS+VtGZx4az7F+3J
         rAbs8CTZX5ImqSgtqwszegh7vCHkLLTdus/NUxM7wvmgAndcIYF8ZiCDwFQfUQtaoBPc
         QVyg==
X-Gm-Message-State: AOAM53065SlymeTSU2+i8CwF4KAxH56vEdAeOThcgHOWEo+O9kXMyb63
	ZXHTYxPXfqMlYNqRlUFK9kZeIXZr9NI+AQ==
X-Google-Smtp-Source: 
 ABdhPJw4CJCRZfdqXo5BBcQwV5JsBPvdTfvW7ui9FUfZpVsP1/mXjo8F2x36W9E2OawnQsSmab2L6A==
X-Received: by 2002:a05:6000:2a3:: with SMTP id
 l3mr36183113wry.12.1634570092086;
        Mon, 18 Oct 2021 08:14:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1325:5a42:b4ef:5218?
 ([2001:8b0:aba:5f3c:1325:5a42:b4ef:5218])
        by smtp.gmail.com with ESMTPSA id
 z5sm22558904wmp.26.2021.10.18.08.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 08:14:51 -0700 (PDT)
Message-ID: 
 <a484a4c92e1e396aadd91efdc29a36c55c79ae01.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] manuals: rename "devpyshell" to "pydevshell"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs@lists.yoctoproject.org
Date: Mon, 18 Oct 2021 16:14:51 +0100
In-Reply-To: <20211018151042.22885-1-michael.opdenacker@bootlin.com>
References: <20211018151042.22885-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Oct 2021 15:14:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1997

On Mon, 2021-10-18 at 17:10 +0200, Michael Opdenacker wrote:
> This addresses [YOCTO #14531] after the "devpyshell" task was renamed
> to "pydevshell" in OE core.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 12 ++++++------
>  documentation/ref-manual/tasks.rst        |  8 ++++----
>  2 files changed, 10 insertions(+), 10 deletions(-)

Keep in mind we need to be a little careful here. We need to merge the migration
guide to master and honister but this should only be to master.

Cheers,

Richard


