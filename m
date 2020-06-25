Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.1555.1593106658131777425
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2020 10:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dg9IUnz3;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id g67so2725401pgc.8
        for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2020 10:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=+gmgYItAvKuBnAJ0dxXGZiT4i1EipXQsBkyIC1RTxQo=;
        b=dg9IUnz3z3t7At2itMYggIM3Z/57a92oHf6nKXc4F1wVWKZejUf79mCi1K8YxxcqIh
         V1g8lRcAW8DE40xWmfsxs4+yJo2WjRo+Rpfp44/tT0u5CRlatS8cFwGQVmAthYQZKlzf
         2vvehEpK1a6/Sp06uXdGcrP7xdp2VYEmDOBRzEUR3wKpWGPtSI4Ubobfv5k3tv4BvPIF
         nJ/CB+f6PvPS/46XaF2JUDw49pw/EZkPyWpJFig1JPmz75fL4TNR/SCzmuQMt1b5xFKd
         eiEXwfWUh8h7sLksvH4aUmHxazJcJQOI1o+hUXLapgB39/z+pvcuoP82dBODYN3HTxpc
         Zidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=+gmgYItAvKuBnAJ0dxXGZiT4i1EipXQsBkyIC1RTxQo=;
        b=CUYoTcc6PnROsgzFcyVXXdVCg+NEK+jvQoDZFacWtyyc/Fy7S3SYq65nZJ6IKEmzO4
         /fQDiA3EXRW8l00gG878pAuPvMlL11LkEBj4v0R8Rdbapzb7KZb92ezL6AIm73JfiinB
         WEgnS0wTVpqgkHt7UgDg6S4h2jfyM7okV5z4cGM9xlxYC/l+MpD82tDr91uU5hW7elaz
         J+WSuEunBhotquiyx66v7EpHniseH/IpqJA2XniQKtmI8UfQKWf4Abgy3ljrTq6T7n+v
         TAeuCfpvRHM7ATr8XXgITR/LDiy7/jG2YIxJi/29ivLHQ/wSOkDsMAExAFyxHT4qPXaS
         mBoA==
X-Gm-Message-State: AOAM5328IRBpIiUIAq87a1c/w3cq0GgLVEaToV/mnd9m6KXUzcNhlx8I
	gwL+9Z9pbT+k6XdOPrKimvDT2+SH
X-Google-Smtp-Source: ABdhPJxumI1pBudhMUzw+TactQpobKLClkkvm6DeC/+WqPGt/NhCiIoGspX27OMKCSDddVTzTq4L6w==
X-Received: by 2002:a63:564e:: with SMTP id g14mr10990618pgm.326.1593106657312;
        Thu, 25 Jun 2020 10:37:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:acbe:8216:8a55:1b44? ([2601:202:4180:a5c0:acbe:8216:8a55:1b44])
        by smtp.gmail.com with ESMTPSA id m129sm22306878pfm.206.2020.06.25.10.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 10:37:36 -0700 (PDT)
Subject: Re: [docs] Modern style documentation
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: marius.kriegerowski@protonmail.com,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <brBieKgFlfS0C1xLUD5I5LQ0ZKxNBkhcCwKfuzqZTPTQv9slA-1bH2sneuut6k6lMlCO1n_03w5D65oBcbwU2u9Q3ZdmvT-vUWqrLI2jN5c=@protonmail.com>
 <a1ce3e159c94a1826ff718670c8e3bb2195c155c.camel@linuxfoundation.org>
 <CAP71Wjz3=ugDGyfDirANko1KSXC-3qkfYGsuMAkuQ4QhTamzWA@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <fd811933-cb7e-d4fc-5363-4679f9e236fc@gmail.com>
Date: Thu, 25 Jun 2020 10:37:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAP71Wjz3=ugDGyfDirANko1KSXC-3qkfYGsuMAkuQ4QhTamzWA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------56257A6A045D4E51DEB2E64E"
Content-Language: en-US

--------------56257A6A045D4E51DEB2E64E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,


On 6/24/20 7:27 AM, Nicolas Dechesne wrote:
> On Wed, Jun 24, 2020 at 4:23 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> Hi,
>>
>> On Wed, 2020-06-24 at 14:05 +0000, Marius Kriegerowski via
>> lists.yoctoproject.org wrote:
>>> Dear Community,
>>> I would like to motivate a re-structuring of the documentation. The
>>> single page documenting mega manual is great as it carries all the
>>> information. But at the same time it is hard to navigate,
>>> overwhelming for early stage users and hard to pick up where started
>>> earlier on.
>>> Are there plans that break this single page documentation?
>>>
>>> To be more constructive: I find it very convenient and I highly
>>> recommend a permanently shown navigation bar, highlighting where the
>>> current content is located. This allows to find information again,
>>> even if a user only has a vague idea where a piece of information was
>>> found last time, simply thanks to the iinherent structural pattern,
>>> not only the text describing the chapters. Let's take advantage of
>>> the humans being better at remembering shapes and patterns rather
>>> than text and content.
>>>
>>> If this undertaking is already on it's way I'd be happy to join.
Sorry I missed the meeting. I had a conflict with an internal meeting.

One thing I would like to add to the things to look into is the ability to=
:

1) Build documentation via a recipe
2) Include documention=C2=A0 in an SDK


#1 is more for Build automation checkout etc and is needed for #2

I realize this may be a meta-poky thing only.

Are there any other meeting scheduled?



- armin
>> I did notice the discussion on irc.
>>
>> FWIW we're in the middle of planning to migrate the documentation from
>> its current format in docbook over to sphinx. I think that should give
>> us more options for what you describe with navigation in amongst
>> various other advantages.
>>
>> Help with the migration would be much appreciated and we'll keep this
>> need in mind as we work through the details of this.
>>
>> I do think we'll end up with some kind of combination of both formats
>> since some people do need something searchable/scrollable but I realise
>> others need the navigation interface more, there is a place/need for
>> both.
> FWIW. you can check our current work-in-progress thoughts on this topic =
here:
> https://wiki.yoctoproject.org/wiki/index.php?title=3DDocumentation_Sphin=
x
>
>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>=20


--------------56257A6A045D4E51DEB2E64E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hello,<br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/24/20 7:27 AM, Nicolas Dechesne
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAP71Wjz3=ugDGyfDirANko1KSXC-3qkfYGsuMAkuQ4QhTamzWA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Jun 24, 2020 at 4:23 PM Richard Purdie
<a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Hi,

On Wed, 2020-06-24 at 14:05 +0000, Marius Kriegerowski via
lists.yoctoproject.org wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Dear Community,
I would like to motivate a re-structuring of the documentation. The
single page documenting mega manual is great as it carries all the
information. But at the same time it is hard to navigate,
overwhelming for early stage users and hard to pick up where started
earlier on.
Are there plans that break this single page documentation?

To be more constructive: I find it very convenient and I highly
recommend a permanently shown navigation bar, highlighting where the
current content is located. This allows to find information again,
even if a user only has a vague idea where a piece of information was
found last time, simply thanks to the iinherent structural pattern,
not only the text describing the chapters. Let's take advantage of
the humans being better at remembering shapes and patterns rather
than text and content.

If this undertaking is already on it's way I'd be happy to join.</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    Sorry I missed the meeting. I had a conflict with an internal
    meeting.<br>
    <br>
    One thing I would like to add to the things to look into is the
    ability to:<br>
    <br>
    1) Build documentation via a recipe<br>
    2) Include documention  in an SDK<br>
    <br>
    <br>
    #1 is more for Build automation checkout etc and is needed for #2<br>
    <br>
    I realize this may be a meta-poky thing only.<br>
    <br>
    Are there any other meeting scheduled?<br>
    <br>
    <br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CAP71Wjz3=ugDGyfDirANko1KSXC-3qkfYGsuMAkuQ4QhTamzWA@mail.gmail.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
I did notice the discussion on irc.

FWIW we're in the middle of planning to migrate the documentation from
its current format in docbook over to sphinx. I think that should give
us more options for what you describe with navigation in amongst
various other advantages.

Help with the migration would be much appreciated and we'll keep this
need in mind as we work through the details of this.

I do think we'll end up with some kind of combination of both formats
since some people do need something searchable/scrollable but I realise
others need the navigation interface more, there is a place/need for
both.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
FWIW. you can check our current work-in-progress thoughts on this topic here:
<a class="moz-txt-link-freetext" href="https://wiki.yoctoproject.org/wiki/index.php?title=Documentation_Sphinx">https://wiki.yoctoproject.org/wiki/index.php?title=Documentation_Sphinx</a>


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Cheers,

Richard


</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------56257A6A045D4E51DEB2E64E--
