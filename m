Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.4396.1581386876880848090
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 18:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I5a9k0OP;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id e8so3584357plt.9
        for <docs@lists.yoctoproject.org>; Mon, 10 Feb 2020 18:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=8c7YbHvrwUUcwZwM76Bfi4LMu+mb0eAXtrMhj4UoxKE=;
        b=I5a9k0OP0PHxSKjWVBJHoofutxgu6k6ENX4vkFcqbS1MRdZU0Ir5d2zqPjcb8VB9j0
         TLoz/abk3Y5WYcKIuAPxXw7yCcIll53hFi5VN3NHteGF2KlqD+B3OADHZZssq3xQoEUJ
         yApglKnxAGf88wNjYXUzwm7CVQ5Vg8GiayfG0piG7qLbrcKGFyjGW9+Bmd8AvvgrxElV
         NCz3yU5lDqu5zBMVmujrz22BF6NIXVctWRWAIaXv+xJmQhVROdsAOib37Rlx8tAC0SRF
         Q5tnEbSX+aZ0F82rw8iYuzsiq9AXi/I0o+4cQPJ+6y8AO9dgFRb/6lCpvOWz65zXt2cf
         GCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=8c7YbHvrwUUcwZwM76Bfi4LMu+mb0eAXtrMhj4UoxKE=;
        b=c0Qa9EGmH3r/Mqx4djJSLtfH4W9mxZvN1m63VbykiDmNUJ3Th7f+cDPGW3Klk55ndr
         nWrMxXTjQ50mSrxRepkcwvpAmH3fLDnjfqyqLlWT5XIlhPBe06AI6I1SW95itgjMDDp3
         W6jJ8/3yXVk6pJvzr3JLZCdVY7SscvcfNMm660ByfdeDMBTaVeC+PNfLGtmhF5oZ+I4a
         v1S0m8EzUjs9K+YJkR5pagcGJ7dGg+Jix/NG+MV6b/R5cYCo51I8jAvrLHNa1gSioJ10
         fmO9xQAfBre14CoLXswh/6jArUR/yL05W5KpIKY711GuzbLK+J17OjblSMrqX3epnKpF
         Vr8g==
X-Gm-Message-State: APjAAAW74WaMmGlQYORh1Kk+frRDaPPf7wjis1n9JkGnsuQVVpX9aYAK
	xy0yHZRde4RNVEJvrv9XASrTEaZd
X-Google-Smtp-Source: APXvYqygf7iC01DthCa0B0nwdQDtH/JH/oZVP2GQ+P0XkgkXX4wojcC5tM8B0/0kYaFUj/jU4txAhA==
X-Received: by 2002:a17:90b:3011:: with SMTP id hg17mr941671pjb.90.1581386876055;
        Mon, 10 Feb 2020 18:07:56 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:58cf:c2e4:7ede:a168? ([2601:202:4180:a5c0:58cf:c2e4:7ede:a168])
        by smtp.gmail.com with ESMTPSA id p24sm1401204pgk.19.2020.02.10.18.07.55
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2020 18:07:55 -0800 (PST)
Subject: Re: [docs] [PATCH] README: A couple of updates due to recent changes
To: docs@lists.yoctoproject.org
References: <20200210033743.24295-1-tanuk@iki.fi>
 <f2b93c68-e11f-0007-f2e9-1cb5403461d0@gmail.com>
 <5d6c5c4a1eab46639d88912056a59f13@XBOX03.axis.com>
 <425c5b7a-f1a6-0c5f-0e5c-77eef392f681@gmail.com>
 <282e466e0097401e86157215fe3fb883@XBOX03.axis.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <3e3671e6-02fb-7560-d886-a515122757ac@gmail.com>
Date: Mon, 10 Feb 2020 18:07:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <282e466e0097401e86157215fe3fb883@XBOX03.axis.com>
Content-Type: multipart/alternative;
 boundary="------------17E69566FD089F5E2CBB9C36"
Content-Language: en-US

--------------17E69566FD089F5E2CBB9C36
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 2/10/20 5:57 PM, Peter Kjellerstedt wrote:
>
> Are you thinking of the layers in meta-openembedded? There it makes
> sense since many layers share one mailing list. However, here we are
> talking about the docs repository with its own mailing list. There
> should be no other patches sent to it than those that are intended for
> the docs repository, so there should be no need to add an extra
> [yocto-docs] prefix.
>
I agree. no need to include [yocto-docs] in the subject line.

I mean "git sent-email -1 -M --subject-prefix=PATCH --to
docs@lists.yoctoproject.org"

don't we want a subject? the subject part was removed from the README.

-- armin
>
> And for the record, this matches the documentation for bitbake, which
> also has its own mailing list.
>
>  
>
> //Peter
>
>  
>
> *From:*docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> *On
> Behalf Of *akuster
> *Sent:* den 11 februari 2020 02:34
> *To:* docs@lists.yoctoproject.org
> *Subject:* Re: [docs] [PATCH] README: A couple of updates due to
> recent changes
>
>  
>
>  
>
> On 2/10/20 5:01 PM, Peter Kjellerstedt wrote:
>
>     There will be a subject, but there is no reason to prefix it with
>     “[yocto-docs]” anymore, is there?
>
> nope.  All the other layers have --subject-prefix so it would be nice
> to keep it consistent.
>
> - armin
>
>      
>
>     //Peter
>
>      
>
>     *From:*docs@lists.yoctoproject.org
>     <mailto:docs@lists.yoctoproject.org> <docs@lists.yoctoproject.org>
>     <mailto:docs@lists.yoctoproject.org> *On Behalf Of *akuster
>     *Sent:* den 10 februari 2020 18:01
>     *To:* docs@lists.yoctoproject.org <mailto:docs@lists.yoctoproject.org>
>     *Subject:* Re: [docs] [PATCH] README: A couple of updates due to
>     recent changes
>
>      
>
>      
>
>     On 2/9/20 7:37 PM, Tanu Kaskinen wrote:
>
>         Since there's now a separate mailing list for docs, I think the
>
>         yocto-docs tag doesn't need to be added to patches any more.
>
>          
>
>         ---
>
>          
>
>          README | 6 ++----
>
>          1 file changed, 2 insertions(+), 4 deletions(-)
>
>          
>
>         diff --git a/README b/README
>
>         index 62c2a3ffb..6a7f3abe6 100644
>
>         --- a/README
>
>         +++ b/README
>
>         @@ -11,15 +11,13 @@ Where to Send Patches
>
>          =====================
>
>          
>
>          When sending single patches, please using something like:
>
>         -'git send-email -1 --to docs@lists.yoctoproject.org <mailto:docs@lists.yoctoproject.org> --subject-prefix=yocto-docs][PATCH'
>
>         +'git send-email -1 --to docs@lists.yoctoproject.org <mailto:docs@lists.yoctoproject.org>
>
>     We still need a subject
>
>
>          
>
>         -These values can be set as defaults for this repository:
>
>         +The To header can be set as default for this repository:
>
>          
>
>          $ git config sendemail.to docs@lists.yoctoproject.org <mailto:docs@lists.yoctoproject.org>
>
>         -$ git config format.subjectPrefix yocto-docs][PATCH
>
>     We still need a subject
>
>
>          
>
>          
>
>          Now you can just do 'git send-email origin/master' to send all local patches.
>
>          
>
>          Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
>
>          Mailing list: docs@lists.yoctoproject.org <mailto:docs@lists.yoctoproject.org>
>
>         -Please cc: Scott Rifenbark <srifenbark@gmail.com> <mailto:srifenbark@gmail.com> on changes.
>
>
>
>
>          
>
>      
>
>
>
>      
>
>  
>
>
> 


--------------17E69566FD089F5E2CBB9C36
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2/10/20 5:57 PM, Peter Kjellerstedt
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:282e466e0097401e86157215fe3fb883@XBOX03.axis.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#943634;
	font-weight:normal;
	font-style:normal;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#943634;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span
            style="color:#943634;mso-fareast-language:EN-US"
            lang="EN-US">Are you thinking of the layers in
            meta-openembedded? There it makes sense since many layers
            share one mailing list. However, here we are talking about
            the docs repository with its own mailing list. There should
            be no other patches sent to it than those that are intended
            for the docs repository, so there should be no need to add
            an extra [yocto-docs] prefix. </span></p>
      </div>
    </blockquote>
    I agree. no need to include [yocto-docs] in the subject line.<br>
    <br>
    I mean "git sent-email -1 -M --subject-prefix=PATCH --to
    <a class="moz-txt-link-abbreviated" href="mailto:docs@lists.yoctoproject.org">docs@lists.yoctoproject.org</a>"<br>
    <br>
    don't we want a subject? the subject part was removed from the
    README.<br>
    <br>
    -- armin<br>
    <blockquote type="cite"
      cite="mid:282e466e0097401e86157215fe3fb883@XBOX03.axis.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span
            style="color:#943634;mso-fareast-language:EN-US"
            lang="EN-US">And for the record, this matches the
            documentation for bitbake, which also has its own mailing
            list.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="color:#943634;mso-fareast-language:EN-US"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="color:#943634;mso-fareast-language:EN-US"
            lang="EN-US">//Peter<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="color:#943634;mso-fareast-language:EN-US"
            lang="EN-US"><o:p> </o:p></span></p>
        <div style="border:none;border-left:solid blue 1.5pt;padding:0cm
          0cm 0cm 4.0pt">
          <div>
            <div style="border:none;border-top:solid #E1E1E1
              1.0pt;padding:3.0pt 0cm 0cm 0cm">
              <p class="MsoNormal"><b><span lang="EN-US">From:</span></b><span
                  lang="EN-US"> <a class="moz-txt-link-abbreviated" href="mailto:docs@lists.yoctoproject.org">docs@lists.yoctoproject.org</a>
                  <a class="moz-txt-link-rfc2396E" href="mailto:docs@lists.yoctoproject.org">&lt;docs@lists.yoctoproject.org&gt;</a>
                  <b>On Behalf Of </b>akuster<br>
                  <b>Sent:</b> den 11 februari 2020 02:34<br>
                  <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:docs@lists.yoctoproject.org">docs@lists.yoctoproject.org</a><br>
                  <b>Subject:</b> Re: [docs] [PATCH] README: A couple of
                  updates due to recent changes<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p> </o:p></p>
          <p class="MsoNormal" style="margin-bottom:12.0pt"><o:p> </o:p></p>
          <div>
            <p class="MsoNormal">On 2/10/20 5:01 PM, Peter Kjellerstedt
              wrote:<o:p></o:p></p>
          </div>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <p class="MsoNormal"><span
                style="color:#943634;mso-fareast-language:EN-US"
                lang="EN-US">There will be a subject, but there is no
                reason to prefix it with “[yocto-docs]” anymore, is
                there?</span><o:p></o:p></p>
          </blockquote>
          <p class="MsoNormal">nope.  All the other layers have
            --subject-prefix so it would be nice to keep it consistent.<br>
            <br>
            - armin<br>
            <br>
            <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <p class="MsoNormal"><span
                style="color:#943634;mso-fareast-language:EN-US"
                lang="EN-US"> </span><o:p></o:p></p>
            <p class="MsoNormal"><span
                style="color:#943634;mso-fareast-language:EN-US"
                lang="EN-US">//Peter</span><o:p></o:p></p>
            <p class="MsoNormal"><span
                style="color:#943634;mso-fareast-language:EN-US"
                lang="EN-US"> </span><o:p></o:p></p>
            <div style="border:none;border-left:solid blue
              1.5pt;padding:0cm 0cm 0cm 4.0pt">
              <div>
                <div style="border:none;border-top:solid #E1E1E1
                  1.0pt;padding:3.0pt 0cm 0cm 0cm">
                  <p class="MsoNormal"><b><span lang="EN-US">From:</span></b><span
                      lang="EN-US"> <a
                        href="mailto:docs@lists.yoctoproject.org"
                        moz-do-not-send="true">
                        docs@lists.yoctoproject.org</a> <a
                        href="mailto:docs@lists.yoctoproject.org"
                        moz-do-not-send="true">&lt;docs@lists.yoctoproject.org&gt;</a>
                      <b>On Behalf Of </b>akuster<br>
                      <b>Sent:</b> den 10 februari 2020 18:01<br>
                      <b>To:</b> <a
                        href="mailto:docs@lists.yoctoproject.org"
                        moz-do-not-send="true">docs@lists.yoctoproject.org</a><br>
                      <b>Subject:</b> Re: [docs] [PATCH] README: A
                      couple of updates due to recent changes</span><o:p></o:p></p>
                </div>
              </div>
              <p class="MsoNormal"> <o:p></o:p></p>
              <p class="MsoNormal" style="margin-bottom:12.0pt"> <o:p></o:p></p>
              <div>
                <p class="MsoNormal">On 2/9/20 7:37 PM, Tanu Kaskinen
                  wrote:<o:p></o:p></p>
              </div>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre>Since there's now a separate mailing list for docs, I think the<o:p></o:p></pre>
                <pre>yocto-docs tag doesn't need to be added to patches any more.<o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre>---<o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre> README | 6 ++----<o:p></o:p></pre>
                <pre> 1 file changed, 2 insertions(+), 4 deletions(-)<o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre>diff --git a/README b/README<o:p></o:p></pre>
                <pre>index 62c2a3ffb..6a7f3abe6 100644<o:p></o:p></pre>
                <pre>--- a/README<o:p></o:p></pre>
                <pre>+++ b/README<o:p></o:p></pre>
                <pre>@@ -11,15 +11,13 @@ Where to Send Patches<o:p></o:p></pre>
                <pre> =====================<o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre> When sending single patches, please using something like:<o:p></o:p></pre>
                <pre>-'git send-email -1 --to <a href="mailto:docs@lists.yoctoproject.org" moz-do-not-send="true">docs@lists.yoctoproject.org</a> --subject-prefix=yocto-docs][PATCH'<o:p></o:p></pre>
                <pre>+'git send-email -1 --to <a href="mailto:docs@lists.yoctoproject.org" moz-do-not-send="true">docs@lists.yoctoproject.org</a><o:p></o:p></pre>
              </blockquote>
              <p class="MsoNormal">We still need a subject<br>
                <br>
                <br>
                <o:p></o:p></p>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre> <o:p></o:p></pre>
                <pre>-These values can be set as defaults for this repository:<o:p></o:p></pre>
                <pre>+The To header can be set as default for this repository:<o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre> $ git config sendemail.to <a href="mailto:docs@lists.yoctoproject.org" moz-do-not-send="true">docs@lists.yoctoproject.org</a><o:p></o:p></pre>
                <pre>-$ git config format.subjectPrefix yocto-docs][PATCH<o:p></o:p></pre>
              </blockquote>
              <p class="MsoNormal">We still need a subject<br>
                <br>
                <br>
                <o:p></o:p></p>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre> <o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre> Now you can just do 'git send-email origin/master' to send all local patches.<o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre> Git repository: <a href="http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/" moz-do-not-send="true">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/</a><o:p></o:p></pre>
                <pre> Mailing list: <a href="mailto:docs@lists.yoctoproject.org" moz-do-not-send="true">docs@lists.yoctoproject.org</a><o:p></o:p></pre>
                <pre>-Please cc: Scott Rifenbark <a href="mailto:srifenbark@gmail.com" moz-do-not-send="true">&lt;srifenbark@gmail.com&gt;</a> on changes.<o:p></o:p></pre>
                <p class="MsoNormal"><br>
                  <br>
                  <br>
                  <o:p></o:p></p>
                <pre> <o:p></o:p></pre>
              </blockquote>
              <p class="MsoNormal"> <o:p></o:p></p>
            </div>
            <p class="MsoNormal"><br>
              <br>
              <o:p></o:p></p>
            <pre><o:p> </o:p></pre>
          </blockquote>
          <p class="MsoNormal"><o:p> </o:p></p>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------17E69566FD089F5E2CBB9C36--
