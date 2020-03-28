Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.15694.1585430201978692351
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Mar 2020 14:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=LqzTzqhP;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [100.115.92.199] (unknown [199.58.187.135])
	by linux.microsoft.com (Postfix) with ESMTPSA id CC07420B4737;
	Sat, 28 Mar 2020 14:16:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CC07420B4737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1585430201;
	bh=CJ8vmRz6ztbEaN5mfIKLOwbQX+mKkaDHCRkhICaB2Ns=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=LqzTzqhPiGIFTGqwUoDXzJxnRE13IL/slX3YsRQg6OkQAnN0suNZt1ZTdVevt63aC
	 hLJQntqG1Xck3qZ6qGR53y1GZHxgx+UHWkrHtX4VSvQL2Va5efPDHyHAR+DjBdU2Ya
	 GXwuveUcnbFXBPC7B37jBxlQXx+XFyDMybvAN61g=
Subject: Re: [docs] [PATCH 1/3] dev-manual: Fix CROPS link
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org
References: <20200328092106.28231-1-alhe@linux.microsoft.com>
 <20200328092106.28231-2-alhe@linux.microsoft.com>
 <3d99e73d-4ece-ab8b-f035-804759097951@gmail.com>
From: alhe@linux.microsoft.com
Message-ID: <976dd467-7da7-9219-cbc2-55096f57e162@linux.microsoft.com>
Date: Sat, 28 Mar 2020 15:16:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3d99e73d-4ece-ab8b-f035-804759097951@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------99136044E120341A978EB421"
Content-Language: en-US

--------------99136044E120341A978EB421
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Armin,

On 3/28/20 12:53 PM, akuster wrote:
>
>
> On 3/28/20 2:21 AM, alhe@linux.microsoft.com wrote:
>> The link used in the documentation points to a file
>> that no longer exists on the crops repository.
>>
>> Use the poky-container repo instead since it is more
>> accurate and updated
>>
>> Signed-off-by: Alejandro Hernandez Samaniego<alejandro@enedino.org>
>> Signed-off-by: Alejandro Hernandez Samaniego<alhe@linux.microsoft.com>
>> ---
>>   documentation/dev-manual/dev-manual-start.xml | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/documentation/dev-manual/dev-manual-start.xml b/documentation/dev-manual/dev-manual-start.xml
>> index 59ffa49bb6..8d2f316f52 100644
>> --- a/documentation/dev-manual/dev-manual-start.xml
>> +++ b/documentation/dev-manual/dev-manual-start.xml
>> @@ -396,7 +396,7 @@
>>           for development using the Yocto Project.
>>           Your build host can be a native Linux machine (recommended) or it can
>>           be a machine (Linux, Mac, or Windows) that uses
>> -        <ulink url='https://git.yoctoproject.org/cgit/cgit.cgi/crops/about/'>CROPS</ulink>,
>> +        <ulink url='https://github.com/crops/poky-container'>CROPS</ulink>,
>
> So what is "https://git.yoctoproject.org/git/crops" 
> <https://git.yoctoproject.org/git/crops>
>
> used for then. If its wrong, we should either link it or remove that 
> repo from YP git.
>
> - armin


As far as I could tell, its the same as https://github.com/crops/crops 
which has been archived on github, and it says its deprecated, neither 
of them have been updated in 4 years.

Alejandro

>>           which leverages
>>           <ulink url='https://www.docker.com/'>Docker Containers</ulink>.
>>           <note>
>> @@ -517,7 +517,7 @@
>>   
>>           <para>
>>               With
>> -            <ulink url='https://github.com/crops/crops/blob/master/README.md'>CROPS</ulink>,
>> +            <ulink url='https://github.com/crops/poky-container'>CROPS</ulink>,
>>               which leverages
>>               <ulink url='https://www.docker.com/'>Docker Containers</ulink>,
>>               you can create a Yocto Project development environment that
>>
>
>
> 

--------------99136044E120341A978EB421
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hey Armin,<br>
    </p>
    <div class="moz-cite-prefix">On 3/28/20 12:53 PM, akuster wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3d99e73d-4ece-ab8b-f035-804759097951@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <br>
      <br>
      <div class="moz-cite-prefix">On 3/28/20 2:21 AM, <a
          class="moz-txt-link-abbreviated"
          href="mailto:alhe@linux.microsoft.com" moz-do-not-send="true">alhe@linux.microsoft.com</a>
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20200328092106.28231-2-alhe@linux.microsoft.com">
        <pre class="moz-quote-pre" wrap="">The link used in the documentation points to a file
that no longer exists on the crops repository.

Use the poky-container repo instead since it is more
accurate and updated

Signed-off-by: Alejandro Hernandez Samaniego <a class="moz-txt-link-rfc2396E" href="mailto:alejandro@enedino.org" moz-do-not-send="true">&lt;alejandro@enedino.org&gt;</a>
Signed-off-by: Alejandro Hernandez Samaniego <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com" moz-do-not-send="true">&lt;alhe@linux.microsoft.com&gt;</a>
---
 documentation/dev-manual/dev-manual-start.xml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-start.xml b/documentation/dev-manual/dev-manual-start.xml
index 59ffa49bb6..8d2f316f52 100644
--- a/documentation/dev-manual/dev-manual-start.xml
+++ b/documentation/dev-manual/dev-manual-start.xml
@@ -396,7 +396,7 @@
         for development using the Yocto Project.
         Your build host can be a native Linux machine (recommended) or it can
         be a machine (Linux, Mac, or Windows) that uses
-        &lt;ulink url='<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/cgit/cgit.cgi/crops/about/" moz-do-not-send="true">https://git.yoctoproject.org/cgit/cgit.cgi/crops/about/</a>'&gt;CROPS&lt;/ulink&gt;,
+        &lt;ulink url='<a class="moz-txt-link-freetext" href="https://github.com/crops/poky-container" moz-do-not-send="true">https://github.com/crops/poky-container</a>'&gt;CROPS&lt;/ulink&gt;,</pre>
      </blockquote>
      <br>
      So what is "<a rel="vcs-git"
        href="https://git.yoctoproject.org/git/crops" title="crops Git
        repository" moz-do-not-send="true">https://git.yoctoproject.org/git/crops"
      </a><br>
      <br>
      used for then. If its wrong, we should either link it or remove
      that repo from YP git.<br>
      <br>
      - armin<br>
    </blockquote>
    <p><br>
    </p>
    <p>As far as I could tell, its the same as
      <a class="moz-txt-link-freetext" href="https://github.com/crops/crops">https://github.com/crops/crops</a> which has been archived on github,
      and it says its deprecated, neither of them have been updated in 4
      years.</p>
    <p>Alejandro<br>
    </p>
    <blockquote type="cite"
      cite="mid:3d99e73d-4ece-ab8b-f035-804759097951@gmail.com">
      <blockquote type="cite"
        cite="mid:20200328092106.28231-2-alhe@linux.microsoft.com">
        <pre class="moz-quote-pre" wrap="">         which leverages
         &lt;ulink url='<a class="moz-txt-link-freetext" href="https://www.docker.com/" moz-do-not-send="true">https://www.docker.com/</a>'&gt;Docker Containers&lt;/ulink&gt;.
         &lt;note&gt;
@@ -517,7 +517,7 @@
 
         &lt;para&gt;
             With
-            &lt;ulink url='<a class="moz-txt-link-freetext" href="https://github.com/crops/crops/blob/master/README.md" moz-do-not-send="true">https://github.com/crops/crops/blob/master/README.md</a>'&gt;CROPS&lt;/ulink&gt;,
+            &lt;ulink url='<a class="moz-txt-link-freetext" href="https://github.com/crops/poky-container" moz-do-not-send="true">https://github.com/crops/poky-container</a>'&gt;CROPS&lt;/ulink&gt;,
             which leverages
             &lt;ulink url='<a class="moz-txt-link-freetext" href="https://www.docker.com/" moz-do-not-send="true">https://www.docker.com/</a>'&gt;Docker Containers&lt;/ulink&gt;,
             you can create a Yocto Project development environment that
</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
      </blockquote>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------99136044E120341A978EB421--
