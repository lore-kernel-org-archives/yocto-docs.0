Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.14107.1605132333382635582
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 14:05:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HNdCf+qS;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id j7so3933137oie.12
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 14:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=yBEIQhZKWmtRlpOZECLoZlDuZC3/Dc25VXx9lraJa4U=;
        b=HNdCf+qSHnh/ezHCmN0UY4J9rH4+yPm8GNsMNC0r5rDAy28Hv4p8tEulUG2CtPzejZ
         qWCY7Q9FxC38ULO3roURMS+7FqhogIoDv/FLIRupFOy0hy6NjnUnPAXUXMNgp/1cUSf3
         pSlblHI6lhw7ROxKi/0SMBN3SnysV4ndZ+T9VvelInZjbkSF+kqFijKBMGAkJehpLbMy
         9+6XB1bLqm+df385315jzZsnFUf4QkeUA0fUw2bIm7blUoucyT/cBLEI8S9jPC23VFQZ
         ZAl32RaOaYAid+Cadb/jGYKBrlbm+wQdXs7X4hzR8y+eEd0aQ4N3puEeNSZbj/6CbeE+
         rXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=yBEIQhZKWmtRlpOZECLoZlDuZC3/Dc25VXx9lraJa4U=;
        b=GisAFZrsqKPIsgLXYNWcOEzW+Z+gHnnaqt2gA6WxD15PoPqjDg2r6WwyUvqmv4Uln7
         fbLVx+GIhXMBq2mVEUlsyzJVp7+lO1V0KvKnXkly+sZy22DpABj7GRthcrPRTsWRo0bd
         g5ybmPtGESjf8NubtcVrNQZ+JkxefHNMSHt7keJsarLttvtucKP6rpFBTJWgHZrK9Umc
         wHU4gsO2p/5uHps+rCfhgk4jjgOuT2T7+9IzNQJmLjErbq6x4mT7SL6TMe+UtND4X0yF
         wA2JWr/U/OTYMp2xCiDH6oDmpLmhh7bLpzavaGX6qDzJ3C6oiFoqmXqmWhpB4JqRk+C5
         iIfQ==
X-Gm-Message-State: AOAM533EE4yENEcA0vkDHB/c6NuAyyQzqtusj5ifuDxDiaQJs2/czgqG
	pOE28HzWVAKkZrAreFz4IG8bg4pRTPEFQQ==
X-Google-Smtp-Source: ABdhPJxPSHoMC6Ov5ZG3ahL9lzclRzal1lxYKo4R7l4wqjrTM9l2AcYSZyQkZ6vSYzFQ+/jPBKxD+A==
X-Received: by 2002:a54:4590:: with SMTP id z16mr3634815oib.63.1605132332490;
        Wed, 11 Nov 2020 14:05:32 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id q10sm679914oih.56.2020.11.11.14.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 14:05:31 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [docs] [PATCH] documentation: Add Pipenv support
To: shantanoo.desai@gmail.com, docs@lists.yoctoproject.org
References: <20201110212917.25172-1-JPEWhacker@gmail.com>
 <27534.1605130210340595078@lists.yoctoproject.org>
Message-ID: <f4daa05e-8aa6-c817-fe51-910c0f9d0a69@gmail.com>
Date: Wed, 11 Nov 2020 16:05:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <27534.1605130210340595078@lists.yoctoproject.org>
Content-Type: multipart/alternative;
 boundary="------------957F175C7E842E7E896B3CF6"
Content-Language: en-US

--------------957F175C7E842E7E896B3CF6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/11/20 3:30 PM, shantanoo.desai@gmail.com wrote:
>
> Hi Joshua,
>
> I would suggest adding sphinx-serve 
> <https://pypi.org/project/sphinx-serve/> as a dev-package to serve the 
> docs during local development/tests.
>
I'd be fine with that. We can see if anyone else objects, or we can also 
merge as is and add that as a separate patch.

> I was able to serve the Sphinx-RTD on my machine simply by executing 
> |sphinx-serve| in the |documentations/| folder. Maybe mention it in 
> the README too?.
>
> I think Pipenv might be required since I was digging into the Algolia 
> Search Indexing and there you can use their document scraper with 
> Pipenv as well. (see https://docsearch.algolia.com/docs/run-your-own/)
>
> Might be worth the effort, since Nico did mention plans to use an 
> indexing search for the new docs.
>
> Would love your thoughts on this.
>
> Regards,
>
> Shan
>
>
> 
>

--------------957F175C7E842E7E896B3CF6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/11/20 3:30 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:shantanoo.desai@gmail.com">shantanoo.desai@gmail.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:27534.1605130210340595078@lists.yoctoproject.org">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <p>Hi Joshua,</p>
      <p>I would suggest adding <a
          href="https://pypi.org/project/sphinx-serve/" target="_blank"
          moz-do-not-send="true">sphinx-serve</a> as a dev-package to
        serve the docs during local development/tests.</p>
    </blockquote>
    <p>I'd be fine with that. We can see if anyone else objects, or we
      can also merge as is and add that as a separate patch.<br>
    </p>
    <blockquote type="cite"
      cite="mid:27534.1605130210340595078@lists.yoctoproject.org">
      <p>I was able to serve the Sphinx-RTD on my machine simply by
        executing <code>sphinx-serve</code> in the <code>documentations/</code>
        folder. Maybe mention it in the README too?.</p>
      <p>I think Pipenv might be required since I was digging into the
        Algolia Search Indexing and there you can use their document
        scraper with Pipenv as well.
        (see <a href="https://docsearch.algolia.com/docs/run-your-own/"
          target="_blank" moz-do-not-send="true">https://docsearch.algolia.com/docs/run-your-own/</a>)</p>
      <p>Might be worth the effort, since Nico did mention plans to use
        an indexing search for the new docs.</p>
      <p>Would love your thoughts on this.</p>
      <p>Regards,</p>
      <p>Shan</p>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------957F175C7E842E7E896B3CF6--
