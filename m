Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6454C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 18:11:51 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.30497.1669313505695698283
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Nov 2022 10:11:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xJoLbO74;
 spf=pass (domain: linaro.org, ip: 209.85.219.45, mailfrom: javier.tia@linaro.org)
Received: by mail-qv1-f45.google.com with SMTP id s18so1351952qvo.9
        for <docs@lists.yoctoproject.org>; Thu, 24 Nov 2022 10:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkOqFqpFVGTpeCKWkGZo+S4QMLbZ9hFiYz67f2pO09M=;
        b=xJoLbO74pi3aN8oyjieWtOA6yPVq5CDe+RHH5CkfyPk6v3HDl5Ooh4PtVFvgJfABxI
         89DkA9kzcbDQNw5TNA66BrkzFq4LH6Dzfxa5LucjNh8QPMwvPVGtWEwUTlqdwFXRuTnr
         w0pfuH9ZfFlLO+KdMMhyx5gLJDmofaPUrjRzw4OJZhjxzuNRFgRPQfj8G5diWVXYrJma
         ZaaJkh/Ph8USNjWu5BEbHpaoKKatJ9gMs+Z9plEuHbCPH7gxEI8Xa4+m6LZ07lEKNFVz
         t0yAb5SQaBVrboM8/xbtpfpOo1fkUWtPXTR6nAhzJCPe0nZRtA5jZe0qMJxjXDNiiSoC
         TSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TkOqFqpFVGTpeCKWkGZo+S4QMLbZ9hFiYz67f2pO09M=;
        b=m5uh4/LrozKfTHtUgvPjTSOO5tKNYhIqnXF2DRuQ3VyxVog/JQHGxqkhEKCC54JEdl
         0/XWA5HBm7MkyY+mYezBZXsyVeq82AHt/kboGOccjnVr32Xgbw4Qj94A008CG0TL9iwE
         yNIlrmvZDNRNmkkTYdSEBY5859FgUK/VjNBOE2XAMzJQ5UHQZzO/Hnc4fph5vIlIKSrI
         vU9Jw93EpgluGtIpNMWai2TNLOpvxk2B17qHdQOYLzSTt6BW7D1dAko/tAlTcPSz5kFk
         SG17fuV+Vv0asLOsIrWa1kthQ4n0t21QkV6PR446++cDa5+8l5aBZWcTRVJHzgFxjmZn
         auvA==
X-Gm-Message-State: ANoB5pnnqPWnPfICtzw66K5QTtLmpBfl4vhQAI4m/JmeEydLtNm70twF
	6G1cpc38wnxQ5inm7wGesnMu2A==
X-Google-Smtp-Source: AA0mqf7EFdGKO/etn25F/Dp1TXdEoaRX24Bh5tRpYeJH+SayyKz0a6pIW5V9+d1ZndkMwekuCXuoQA==
X-Received: by 2002:a05:6214:3982:b0:4b6:d480:f5ac with SMTP id ny2-20020a056214398200b004b6d480f5acmr16295951qvb.39.1669313504755;
        Thu, 24 Nov 2022 10:11:44 -0800 (PST)
Received: from [192.168.1.15] ([177.93.3.213])
        by smtp.gmail.com with ESMTPSA id v12-20020ac8748c000000b003a5c60686b0sm908316qtq.22.2022.11.24.10.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 10:11:44 -0800 (PST)
Message-ID: <e1ee98de-5651-083d-bdf0-1d3454765f36@linaro.org>
Date: Thu, 24 Nov 2022 12:11:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US-large, es
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: "poky@lists.yoctoproject.org" <poky@lists.yoctoproject.org>,
 docs@lists.yoctoproject.org
References: <20221124012446.483364-1-javier.tia@linaro.org>
 <c6589e1f-aebf-cf1c-97b2-e68c4a9ffafa@bootlin.com>
From: Javier Tia <javier.tia@linaro.org>
Subject: Re: [docs] [PATCH] Add missing iproute and iputils packages for
 Fedora 36
In-Reply-To: <c6589e1f-aebf-cf1c-97b2-e68c4a9ffafa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Nov 2022 18:11:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3505

Hi Michael,

On 11/24/22 02:53, Michael Opdenacker wrote:
> Many thanks for the patch and for testing!
> However, we usually add a new supported distro to
> meta-poky/conf/distro/poky.conf in the meta-yocto repository
> (https://git.yoctoproject.org/meta-yocto/tree/meta-poky/conf/distro/poky.conf),
> before adding it to the docs.
> 
> It seems that Fedora 36 is indeed supported now. See all the successful
> builds onhttps://autobuilder.yoctoproject.org/typhoon/#/builders/86
> 
> Could you send a patch for poky.conf? I could do it but you deserve the
> credit 😄

Sure! Thank you for pointing out the link and the next step to get this 
change merged.

I have submitted the patch [1] adding Fedora 36 as supported distro.

[1] https://lists.yoctoproject.org/g/poky/message/12940

> Then, you can come back with the documentation patch.

I will reply here if it has been merged.

Thanks,
» Javier Tia 🖋


