Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.14444.1593282601267922221
 for <docs@lists.yoctoproject.org>;
 Sat, 27 Jun 2020 11:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OKq0EqdN;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id g17so5492540plq.12
        for <docs@lists.yoctoproject.org>; Sat, 27 Jun 2020 11:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=cFnDl6ap615MVFve+SQtbo5UO2FhJcGGIIjauuTlGNo=;
        b=OKq0EqdNhgoWhvkQn6XkCltSBcEN5lVm9PnjXzCUWUzROqXmW05y9jeMK/wMT+bS4w
         TLd3FIyeNhrdxkj2rsAf56s1e65DSZNE+ZLKNSg7UdieVLENLKw/zxZVvUumFoXSo1gz
         zXHcm/ALiZH+Ja8EFRQCYKBXGZfUZ3YKPVkQPU2+rD1jz20I1dh6mX7sY3QCRPsT7jq8
         UZzmUaoMijSPkAb8sEjBTH0IDA1zZrG9PRDoBTEQ/lo5pH4IG4NWNKdN3fp0MQPEKiS4
         m6z/0/ySpyf2Sr0oIZi0jUz91T/ezCjaDZm7xLuXNPtQFwhJEP9pX8E2sYXk9UEJN/GR
         Ircw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=cFnDl6ap615MVFve+SQtbo5UO2FhJcGGIIjauuTlGNo=;
        b=dsk/KcfAE/DWJPnhmVwPx7s0TDPPf6mGL5fYHx1r8ZT7T7IWW7siCly64r4bia99PX
         EbrCjzIYNC51bGknQiVz2Kc8rFEZahzlc4c7HDHGq3WI5V3ipEQ6/TZ2b3mgfLNYI8Fn
         zONtefhH1xwPeTrcbnUDRqySDzpdY4EnM2xVjsiNbczf+S5HZSkjXUX5VgMPsEtTdApw
         O9SX6FWj2TgSj5ClU8+k7PvtapLKhhJmbRLDxYM08M4DLoxztZt0ka+L8lBaUTPdWZA3
         KZUBBNSt0lkLv14Doh8/GIPj3fdp2od92sOdwhM2rJs2BwItbjFrVLdRr8/ymuxdB5a0
         L+dg==
X-Gm-Message-State: AOAM530A0z11qHjBiyA845QKwNuqnyPkrgZbo3K58FuHlRNrhofy5/99
	vt3b7OWrK0CTOehU/wYQAKs5kthR
X-Google-Smtp-Source: ABdhPJzZcHnw2lUccj9wGwWSJceVjR5uURaUXVzOdZohFN2BMjfwu3lmKZQuSmKHaC/tqZ60v/JRSQ==
X-Received: by 2002:a17:902:ba92:: with SMTP id k18mr7372959pls.264.1593282600391;
        Sat, 27 Jun 2020 11:30:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:f4ca:9bde:369a:d30c? ([2601:202:4180:a5c0:f4ca:9bde:369a:d30c])
        by smtp.gmail.com with ESMTPSA id q13sm30119430pfk.8.2020.06.27.11.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2020 11:29:59 -0700 (PDT)
Subject: Re: [docs] Modern style documentation
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 marius.kriegerowski@protonmail.com,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <brBieKgFlfS0C1xLUD5I5LQ0ZKxNBkhcCwKfuzqZTPTQv9slA-1bH2sneuut6k6lMlCO1n_03w5D65oBcbwU2u9Q3ZdmvT-vUWqrLI2jN5c=@protonmail.com>
 <a1ce3e159c94a1826ff718670c8e3bb2195c155c.camel@linuxfoundation.org>
 <CAP71Wjz3=ugDGyfDirANko1KSXC-3qkfYGsuMAkuQ4QhTamzWA@mail.gmail.com>
 <fd811933-cb7e-d4fc-5363-4679f9e236fc@gmail.com>
 <CAP71Wjz8QeY9NkpR1Mmee4qpMWF-j-iJ_s+BqVH0DXd8O20WSQ@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <f8faaf6e-8dde-e806-6bba-0163d05d3d2b@gmail.com>
Date: Sat, 27 Jun 2020 11:29:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAP71Wjz8QeY9NkpR1Mmee4qpMWF-j-iJ_s+BqVH0DXd8O20WSQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------4EBD2547E9DC8EAE3A9DF0D7"
Content-Language: en-US

--------------4EBD2547E9DC8EAE3A9DF0D7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 6/26/20 1:12 AM, Nicolas Dechesne wrote:
>
>
> On Thu, Jun 25, 2020 at 7:37 PM akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Hello,
>
>
>     On 6/24/20 7:27 AM, Nicolas Dechesne wrote:
>>     On Wed, Jun 24, 2020 at 4:23 PM Richard Purdie
>>     <richard.purdie@linuxfoundation.org> <mailto:richard.purdie@linuxfoundation.org> wrote:
>>>     Hi,
>>>
>>>     On Wed, 2020-06-24 at 14:05 +0000, Marius Kriegerowski via
>>>     lists.yoctoproject.org <http://lists.yoctoproject.org> wrote:
>>>>     Dear Community,
>>>>     I would like to motivate a re-structuring of the documentation. The
>>>>     single page documenting mega manual is great as it carries all the
>>>>     information. But at the same time it is hard to navigate,
>>>>     overwhelming for early stage users and hard to pick up where started
>>>>     earlier on.
>>>>     Are there plans that break this single page documentation?
>>>>
>>>>     To be more constructive: I find it very convenient and I highly
>>>>     recommend a permanently shown navigation bar, highlighting where the
>>>>     current content is located. This allows to find information again,
>>>>     even if a user only has a vague idea where a piece of information was
>>>>     found last time, simply thanks to the iinherent structural pattern,
>>>>     not only the text describing the chapters. Let's take advantage of
>>>>     the humans being better at remembering shapes and patterns rather
>>>>     than text and content.
>>>>
>>>>     If this undertaking is already on it's way I'd be happy to join.
>     Sorry I missed the meeting. I had a conflict with an internal meeting.
>
>     One thing I would like to add to the things to look into is the
>     ability to:
>
>     1) Build documentation via a recipe 
>
>     2) Include documention  in an SDK
>
>
>     #1 is more for Build automation checkout etc and is needed for #2
>
>     I realize this may be a meta-poky thing only.
>
>
> Can you elaborate on what you are asking here? A recipe would need to
> 'fetch' the document sources with a fixed SRCREV. Or do you want to
> build the 'current' set of files from the documentation folder? 

Why not build the docs during core-image-minimal???   and yeah, the Docs
are in their own repo so one could have a recipe to build the docs. 
Someone could do that today.

-armin
>
>
>     Are there any other meeting scheduled?
>
>
> Not at this point of time. I believe the next step was
> discussion/agreement from the TSC. and once that is done, we will
> start pushing a sphinx branch and hack on it.
>  
>
>
>
>
>     - armin
>>>     I did notice the discussion on irc.
>>>
>>>     FWIW we're in the middle of planning to migrate the documentation from
>>>     its current format in docbook over to sphinx. I think that should give
>>>     us more options for what you describe with navigation in amongst
>>>     various other advantages.
>>>
>>>     Help with the migration would be much appreciated and we'll keep this
>>>     need in mind as we work through the details of this.
>>>
>>>     I do think we'll end up with some kind of combination of both formats
>>>     since some people do need something searchable/scrollable but I realise
>>>     others need the navigation interface more, there is a place/need for
>>>     both.
>>     FWIW. you can check our current work-in-progress thoughts on this topic here:
>>     https://wiki.yoctoproject.org/wiki/index.php?title=Documentation_Sphinx
>>
>>
>>>     Cheers,
>>>
>>>     Richard
>>>
>>>
>>>
>>>     
>


--------------4EBD2547E9DC8EAE3A9DF0D7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/26/20 1:12 AM, Nicolas Dechesne
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAP71Wjz8QeY9NkpR1Mmee4qpMWF-j-iJ_s+BqVH0DXd8O20WSQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Jun 25, 2020 at 7:37
            PM akuster808 &lt;<a href="mailto:akuster808@gmail.com"
              moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div> Hello,<br>
              <br>
              <br>
              <div>On 6/24/20 7:27 AM, Nicolas Dechesne wrote:<br>
              </div>
              <blockquote type="cite">
                <pre>On Wed, Jun 24, 2020 at 4:23 PM Richard Purdie
<a href="mailto:richard.purdie@linuxfoundation.org" target="_blank" moz-do-not-send="true">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
                <blockquote type="cite">
                  <pre>Hi,

On Wed, 2020-06-24 at 14:05 +0000, Marius Kriegerowski via
<a href="http://lists.yoctoproject.org" target="_blank" moz-do-not-send="true">lists.yoctoproject.org</a> wrote:
</pre>
                  <blockquote type="cite">
                    <pre>Dear Community,
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
              Sorry I missed the meeting. I had a conflict with an
              internal meeting.<br>
              <br>
              One thing I would like to add to the things to look into
              is the ability to:<br>
              <br>
              1) Build documentation via a recipe </div>
          </blockquote>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div> 2) Include documention  in an SDK<br>
              <br>
              <br>
              #1 is more for Build automation checkout etc and is needed
              for #2<br>
              <br>
              I realize this may be a meta-poky thing only.<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Can you elaborate on what you are asking here? A recipe
            would need to 'fetch' the document sources with a fixed
            SRCREV. Or do you want to build the 'current' set of files
            from the documentation folder?  <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Why not build the docs during core-image-minimal???   and yeah, the
    Docs are in their own repo so one could have a recipe to build the
    docs.  Someone could do that today.<br>
    <br>
    -armin<br>
    <blockquote type="cite"
cite="mid:CAP71Wjz8QeY9NkpR1Mmee4qpMWF-j-iJ_s+BqVH0DXd8O20WSQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div> <br>
              Are there any other meeting scheduled?<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Not at this point of time. I believe the next step was
            discussion/agreement from the TSC. and once that is done, we
            will start pushing a sphinx branch and hack on it.</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div> <br>
              <br>
              <br>
              - armin<br>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre>I did notice the discussion on irc.

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
                <pre>FWIW. you can check our current work-in-progress thoughts on this topic here:
<a href="https://wiki.yoctoproject.org/wiki/index.php?title=Documentation_Sphinx" target="_blank" moz-do-not-send="true">https://wiki.yoctoproject.org/wiki/index.php?title=Documentation_Sphinx</a>


</pre>
                <blockquote type="cite">
                  <pre>Cheers,

Richard


</pre>
                  <br>
                  <fieldset></fieldset>
                  <pre>
</pre>
                </blockquote>
              </blockquote>
              <br>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------4EBD2547E9DC8EAE3A9DF0D7--
