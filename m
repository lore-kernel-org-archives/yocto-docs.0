Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5144C77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 09:17:37 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.21564.1684487850401741051
 for <docs@lists.yoctoproject.org>;
 Fri, 19 May 2023 02:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=rx7g+SXP;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f27b65bbf9so3415774e87.0
        for <docs@lists.yoctoproject.org>; Fri, 19 May 2023 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684487848; x=1687079848;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bAqVJ4f02DhK8NgprNu2/VHh+YB00//uQuWpi+nLPAQ=;
        b=rx7g+SXPvAFDY5VywWfvIvSlvlOaWtmtxyxAeP+b4HhBb8Fz7gbzut7RpMFgVRVq1Q
         AG4JUFUmIPhaVgHcC39JZEe16UbOUzYAF733au0jwA2g3JZGzND9dQSfAfeYTwAiI/s+
         ktaoCRsk6bjgQSVRuVMZnQbuhZLBhgTQR+mBH6hdWpFbHBJMuDCNXAYPp0KIEoBaCk9u
         fyrLUIx/+qay2rSjy+uRlcnKwj9XawC31mHq7F5LzLXvAlM3PfoOxRf2L+x0eQvf7NAl
         HDNc491Y1yv6RqisCSXGsVxKu85jb0o0lAZcs+6zsbOrHUgw6WSekqy5QZnZd2Gzh/gU
         hJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684487848; x=1687079848;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAqVJ4f02DhK8NgprNu2/VHh+YB00//uQuWpi+nLPAQ=;
        b=T/6aj753H8B+Rgg0fM5HGBn6CSgZmrt59Q7KILYlZWcP4z1JWK40zXVb/3xoPOJm6Q
         1sMGXUgB6QZ52cp1/Vdz6ptoa1iGrctZSLR68VOzfrZIulv4nqFXcSFvJ72u0j9Cqj91
         4vUPm+V0MtP05LLYDY1wpUN4sLe3JCNd99OkecLmw2N8AQpCQTxo2KUYUyzciMZOioNZ
         BIQm80/Dima6BRsX0VBPr4nIslA8gIsE2CSeSdUgE41jpdQLM9tNWV+unB+dCF9Brdh8
         aFlQUqu+ULN5F8e0XjRXV90iYRkYwKWie34yOHhIajAh0M/8Kyi0wvWie3JawWh+rb97
         tWWQ==
X-Gm-Message-State: AC+VfDyLKRy3g8D6gjz8TxenjvVR9Koh48fiZI0aq7AJvegWShLANhVm
	sk0F3K5egDaRoF3qqY3R5CwkwQ==
X-Google-Smtp-Source: ACHHUZ6WQmt6+s1dZc248WRf7KvBHem9mPGc1P00eae+NZ85V7DzZBXxMiBfaN1HT4cH6iS1qAkWNA==
X-Received: by 2002:ac2:4354:0:b0:4f3:91a2:279 with SMTP id o20-20020ac24354000000b004f391a20279mr569902lfl.61.1684487848505;
        Fri, 19 May 2023 02:17:28 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id 17-20020ac24851000000b004f3940c2b07sm520488lfy.274.2023.05.19.02.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 02:17:27 -0700 (PDT)
Date: Fri, 19 May 2023 12:17:25 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: andrej.valek@siemens.com
Cc: openembedded-core@lists.openembedded.org,
	Peter Marko <peter.marko@siemens.com>, docs@lists.yoctoproject.org,
	michael.opdenacker@bootlin.com
Subject: Re: [OE-core][PATCH v4 1/3] cve-check: add option to add additional
 patched CVEs
Message-ID: <ZGc+pX0P8Els+ab9@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519085823.90027-1-andrej.valek@siemens.com>
 <20230519081850.82586-1-andrej.valek@siemens.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 May 2023 09:17:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3951

Hi,

Looks good to me now. Thanks a lot!

Acked-by: Mikko Rapeli <mikko.rapeli@linaro.org>

Cheers,

-Mikko


