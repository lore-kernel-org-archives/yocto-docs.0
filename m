Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.493.1585616099616955189
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Mar 2020 17:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=a9sMjX3/;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.135] (cpe-173-172-201-6.elp.res.rr.com [173.172.201.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id AD44A20B46F0;
	Mon, 30 Mar 2020 17:54:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AD44A20B46F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1585616099;
	bh=x3aOxFM8a99gN6MzA8iapq3kQ5mQieLUajNGfte9YSA=;
	h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
	b=a9sMjX3/aNQvoopxM5sce6fRAd6SThcWUKGVGmsMQ6AVyRn62bWJ09a3JGYBin5WR
	 AcsuhEhM4eQkl3dxqQCJ8Wgtriu83dWQkPHX7MAOgZeRbyC7KEyaGLIJt/7E92QQz8
	 oaUSMTFuSsQU19HHy7JwGdNNyegJ94fI/4sXuywI=
Subject: Re: [docs] [PATCH 2/4] dev-manual: Document the WSLv2 install process
From: alhe@linux.microsoft.com
To: docs@lists.yoctoproject.org, peter.kjellerstedt@axis.com
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
References: <20200330054251.11134-1-alhe@linux.microsoft.com>
 <20200330054251.11134-2-alhe@linux.microsoft.com>
 <b5d45f4c63454bc18c837a6b63ff8869@XBOX03.axis.com>
 <8288d54d-4efa-9cd0-927b-1a67c0300f8c@linux.microsoft.com>
Message-ID: <c90876bc-0511-b93d-6bc9-9c0a07d10d9d@linux.microsoft.com>
Date: Mon, 30 Mar 2020 17:55:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <8288d54d-4efa-9cd0-927b-1a67c0300f8c@linux.microsoft.com>
Content-Type: multipart/alternative;
 boundary="------------114DE0F1B1675021898A5D19"
Content-Language: en-GB

--------------114DE0F1B1675021898A5D19
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hey Peter,

On 3/30/2020 5:35 PM, Alejandro Hernandez Samaniego wrote:
>
> Hey Peter,
>
> Yeah that seems reasonable, will sent a v2 in a bit.
>
> Alejandro
>
> On 3/30/2020 3:07 AM, Peter Kjellerstedt wrote:
>>> -----Original Message-----
>>> From:docs@lists.yoctoproject.org  <docs@lists.yoctoproject.org>  On Behalf
>>> Ofalhe@linux.microsoft.com
>>> Sent: den 30 mars 2020 07:43
>>> To:docs@lists.yoctoproject.org
>>> Cc:richard.purdie@linuxfoundation.org
>>> Subject: [docs] [PATCH 2/4] dev-manual: Document the WSLv2 install process
>>>
>>> Signed-off-by: Alejandro Hernandez Samaniego<alejandro@enedino.org>
>>> Signed-off-by: Alejandro Hernandez Samaniego<alhe@linux.microsoft.com>
>>> ---
>>>   documentation/dev-manual/dev-manual-start.xml | 145 +++++++++++++++++-
>>>   1 file changed, 139 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/documentation/dev-manual/dev-manual-start.xml b/documentation/dev-manual/dev-manual-start.xml
>>> index 8d2f316f52..a588a37f06 100644
>>> --- a/documentation/dev-manual/dev-manual-start.xml
>>> +++ b/documentation/dev-manual/dev-manual-start.xml
>>> @@ -394,16 +394,16 @@
>>>           This section provides procedures to set up a system to be used as your
>>>           <ulink url='&YOCTO_DOCS_REF_URL;#hardware-build-system-term'>build host</ulink>
>>>           for development using the Yocto Project.
>>> -        Your build host can be a native Linux machine (recommended) or it can
>>> +        Your build host can be a native Linux machine (recommended) it can
>> Please restore the above as it was.
>>
>>>           be a machine (Linux, Mac, or Windows) that uses
>>>           <ulink url='https://github.com/crops/poky-container'>CROPS</ulink>,
>>>           which leverages
>>> -        <ulink url='https://www.docker.com/'>Docker Containers</ulink>.
>>> +        <ulink url='https://www.docker.com/'>Docker Containers</ulink> or it can

Actually restoring te above does not make sense, its missing a ",", but 
I dont think it should say "or it can" several times.


Cheers,

Alejandro

>>> +        be a Windows machine capable of running Windows Subsystem For Linux v2 (WSL).
>>>           <note>
>>> -            You cannot use a build host that is using the
>>> -            <ulink url='https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux'>Windows Subsystem for Linux</ulink>
>>> -            (WSL).
>>> -            The Yocto Project is not compatible with WSL.
>>> +          The Yocto Project is not compatible with <ulink url='https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux'>Windows Subsystem for Linux v1</ulink>
>>> +          , it is compatible but not officially supported nor validated with WSLv2,
>>> +          if you still decide to use WSL please upgrade to <ulink url='https://docs.microsoft.com/en-us/windows/wsl/wsl2-install'>WSLv2</ulink>.
>> Change to:
>>
>>              The Yocto Project is not compatible with
>>              <ulink url='https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux'>Windows Subsystem for Linux v1</ulink>.
>>              It is compatible, but not officially supported nor validated, with WSLv2.
>>              If you still decide to use WSL, please upgrade to
>>              <ulink url='https://docs.microsoft.com/en-us/windows/wsl/wsl2-install'>WSLv2</ulink>.
>>
>> //Peter
>>
>>>           </note>
>>>       </para>
>>>
>>> @@ -654,6 +654,139 @@
>>>               section in the Toaster User Manual.
>>>           </para>
>>>       </section>
>>> +
>>> +    <section id='setting-up-to-use-wsl'>
>>> +        <title>Setting Up to Use Windows Subsystem For Linux (WSLv2)</title>
>>> +
>>> +        <para>
>>> +            With <ulink url='https://docs.microsoft.com/en-us/windows/wsl/wsl2-about'>
>>> +            Windows Subsystem for Linux (WSLv2)</ulink>, you can create a
>>> +            Yocto Project development environment that allows you to build
>>> +            on Windows. You can set up a Linux distribution inside Windows
>>> +            in which you can develop using the Yocto Project.
>>> +        </para>
>>> +
>>> +        <para>
>>> +            Follow these general steps to prepare a Windows machine using WSLv2
>>> +            as your Yocto Project build host:
>>> +            <orderedlist>
>>> +                <listitem><para>
>>> +                    <emphasis>Make sure your Windows 10 machine is capable of running WSLv2:</emphasis>
>>> +
>>> +                    WSLv2 is only available for Windows 10 builds > 18917. To
>>> +                    check which build version you are running, you may open a
>>> +                    command prompt on Windows and execute the command "ver".
>>> +                    <literallayout class='monospaced'>
>>> +    C:\Users\myuser> ver
>>> +
>>> +    Microsoft Windows [Version 10.0.19041.153]
>>> +                    </literallayout>
>>> +                    If your build is capable of running WSLv2 you may continue,
>>> +                    for more information on this subject or instructions on how
>>> +                    to upgrade to WSLv2 visit <ulink url='https://docs.microsoft.com/en-us/windows/wsl/wsl2-install'>Windows 10 WSLv2</ulink>
>>> +                    </para></listitem>
>>> +                <listitem><para>
>>> +                    <emphasis>Install the Linux distribution of your choice inside Windows 10:</emphasis>
>>> +                    Once you know your version of Windows 10 supports WSLv2,
>>> +                    you can install the distribution of your choice from the
>>> +                    Microsoft Store.
>>> +                    Open the Microsoft Store and search for Linux. While there
>>> +                    are several Linux distributions available, the assumption
>>> +                    is that your pick will be one of the distributions supported
>>> +                    by the Yocto Project as stated on the instructions for
>>> +                    using a native Linux host.
>>> +                    After making your selection, simply click "Get" to download
>>> +                    and install the distribution.
>>> +                    </para></listitem>
>>> +                <listitem><para>
>>> +                    <emphasis>Check your Linux distribution is using WSLv2:</emphasis>
>>> +                    Open a Windows PowerShell and run:
>>> +                    <literallayout class='monospaced'>
>>> +    C:\WINDOWS\system32> wsl -l -v
>>> +    NAME      STATE           VERSION
>>> +    *Ubuntu    Running         2
>>> +                    </literallayout>
>>> +                    Note the version column which says the WSL version being used by
>>> +                    your distribution, on compatible systems, this can be changed back
>>> +                    at any point in time.
>>> +                    </para></listitem>
>>> +                <listitem><para>
>>> +                    <emphasis>Optionally Orient Yourself on WSL:</emphasis>
>>> +                    If you are unfamiliar with WSL, you can learn more here -
>>> +                    <ulink url='https://docs.microsoft.com/en-us/windows/wsl/wsl2-about'></ulink>.
>>> +                    </para></listitem>
>>> +                <listitem><para>
>>> +                    <emphasis>Launch your WSL Distibution:</emphasis>
>>> +                    From the Windows start menu simply launch your WSL distribution
>>> +                    just like any other application.
>>> +                    </para></listitem>
>>> +                <listitem><para>
>>> +                    <emphasis>Optimize your WSLv2 storage often:</emphasis>
>>> +                    Due to the way storage is handled on WSLv2, the storage
>>> +                    space used by the undelying Linux distribution is not
>>> +                    reflected immedately, and since bitbake heavily uses
>>> +                    storage, after several builds, you may be unaware you
>>> +                    are running out of space. WSLv2 uses a VHDX file for
>>> +                    storage, this issue can be easily avoided by manually
>>> +                    optimizing this file often, this can be done in the
>>> +                    following way:
>>> +                    <orderedlist>
>>> +                        <listitem><para>
>>> +                            <emphasis>Find the location of your VHDX file:</emphasis>
>>> +                            First you need to find the distro app package directory,
>>> +                            to achieve this open a Windows Powershell as Administrator
>>> +                            and run:
>>> +                            <literallayout class='monospaced'>
>>> +    C:\WINDOWS\system32> Get-AppxPackage -Name "*Ubuntu*" | Select PackageFamilyName
>>> +    PackageFamilyName
>>> +    -----------------
>>> +    CanonicalGroupLimited.UbuntuonWindows_79abcdefgh
>>> +                            </literallayout>
>>> +                            You should now replace the <replaceable>PackageFamilyName</replaceable>
>>> +                            and your <replaceable>user</replaceable> on the following
>>> +                            path to find your VHDX file: <filename>C:\Users\user\AppData\Local\Packages\PackageFamilyName\LocalState\</filename>
>>> +                            For example:
>>> +                            <literallayout class='monospaced'>
>>> +    ls C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\
>>> +    Mode                 LastWriteTime         Length Name
>>> +    -a----         3/14/2020   9:52 PM    57418973184 ext4.vhdx
>>> +                            </literallayout>
>>> +                            Your VHDX file path is: <filename>C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\ext4.vhdx</filename>
>>> +                            </para></listitem>
>>> +                        <listitem><para><emphasis>Optimize your VHDX file:</emphasis>
>>> +                            Open a Windows Powershell as Administrator to optimize
>>> +                            your VHDX file, shutting down WSL first:
>>> +                            <literallayout class='monospaced'>
>>> +    C:\WINDOWS\system32> wsl --shutdown
>>> +    C:\WINDOWS\system32> optimize-vhd -Path C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\ext4.vhdx -Mode full
>>> +                            </literallayout>
>>> +                            A progress bar should be shown while optimizing the VHDX file,
>>> +                            and storage should now be reflected correctly on the Windows
>>> +                            Explorer.
>>> +                            </para></listitem>
>>> +                    </orderedlist>
>>> +                </para></listitem>
>>> +            </orderedlist>
>>> +            <note>
>>> +              The current implementation of WSLv2 does not have out-of-the-box
>>> +              access to external devices such as those connected through a
>>> +              USB port, but it automatically mounts your <filename>C:</filename>
>>> +              drive on <filename>/mnt/c/</filename> (and others), which
>>> +              you can use to share deploy artifacts to be later flashed on
>>> +              hardware through Windows, but your build directory should not
>>> +              reside inside this mountpoint.
>>> +            </note>
>>> +            Once you have WSLv2 set up, everything is in place to
>>> +            develop just as if you were running on a native Linux machine.
>>> +            If you are going to use the Extensible SDK container, see the
>>> +            "<ulink url='&YOCTO_DOCS_SDK_URL;#sdk-extensible'>Using the Extensible SDK</ulink>"
>>> +            Chapter in the Yocto Project Application Development and the
>>> +            Extensible Software Development Kit (eSDK) manual.
>>> +            If you are going to use the Toaster container, see the
>>> +            "<ulink url='&YOCTO_DOCS_TOAST_URL;#toaster-manual-setup-and-use'>Setting Up and Using Toaster</ulink>"
>>> +            section in the Toaster User Manual.
>>> +        </para>
>>> +    </section>
>>>   </section>
>>>
>>>   <section id='locating-yocto-project-source-files'>
>>> --
>>> 2.17.1
>>
>> 

--------------114DE0F1B1675021898A5D19
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p>Hey Peter,<br>
    </p>
    <div class="moz-cite-prefix">On 3/30/2020 5:35 PM, Alejandro
      Hernandez Samaniego wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8288d54d-4efa-9cd0-927b-1a67c0300f8c@linux.microsoft.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <p>Hey Peter,</p>
      <p>Yeah that seems reasonable, will sent a v2 in a bit.</p>
      <p>Alejandro<br>
      </p>
      <div class="moz-cite-prefix">On 3/30/2020 3:07 AM, Peter
        Kjellerstedt wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:b5d45f4c63454bc18c837a6b63ff8869@XBOX03.axis.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:docs@lists.yoctoproject.org" moz-do-not-send="true">docs@lists.yoctoproject.org</a> <a class="moz-txt-link-rfc2396E" href="mailto:docs@lists.yoctoproject.org" moz-do-not-send="true">&lt;docs@lists.yoctoproject.org&gt;</a> On Behalf
Of <a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com" moz-do-not-send="true">alhe@linux.microsoft.com</a>
Sent: den 30 mars 2020 07:43
To: <a class="moz-txt-link-abbreviated" href="mailto:docs@lists.yoctoproject.org" moz-do-not-send="true">docs@lists.yoctoproject.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:richard.purdie@linuxfoundation.org" moz-do-not-send="true">richard.purdie@linuxfoundation.org</a>
Subject: [docs] [PATCH 2/4] dev-manual: Document the WSLv2 install process

Signed-off-by: Alejandro Hernandez Samaniego <a class="moz-txt-link-rfc2396E" href="mailto:alejandro@enedino.org" moz-do-not-send="true">&lt;alejandro@enedino.org&gt;</a>
Signed-off-by: Alejandro Hernandez Samaniego <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com" moz-do-not-send="true">&lt;alhe@linux.microsoft.com&gt;</a>
---
 documentation/dev-manual/dev-manual-start.xml | 145 +++++++++++++++++-
 1 file changed, 139 insertions(+), 6 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-start.xml b/documentation/dev-manual/dev-manual-start.xml
index 8d2f316f52..a588a37f06 100644
--- a/documentation/dev-manual/dev-manual-start.xml
+++ b/documentation/dev-manual/dev-manual-start.xml
@@ -394,16 +394,16 @@
         This section provides procedures to set up a system to be used as your
         &lt;ulink url='&amp;YOCTO_DOCS_REF_URL;#hardware-build-system-term'&gt;build host&lt;/ulink&gt;
         for development using the Yocto Project.
-        Your build host can be a native Linux machine (recommended) or it can
+        Your build host can be a native Linux machine (recommended) it can
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Please restore the above as it was.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">         be a machine (Linux, Mac, or Windows) that uses
         &lt;ulink url='<a class="moz-txt-link-freetext" href="https://github.com/crops/poky-container" moz-do-not-send="true">https://github.com/crops/poky-container</a>'&gt;CROPS&lt;/ulink&gt;,
         which leverages
-        &lt;ulink url='<a class="moz-txt-link-freetext" href="https://www.docker.com/" moz-do-not-send="true">https://www.docker.com/</a>'&gt;Docker Containers&lt;/ulink&gt;.
+        &lt;ulink url='<a class="moz-txt-link-freetext" href="https://www.docker.com/" moz-do-not-send="true">https://www.docker.com/</a>'&gt;Docker Containers&lt;/ulink&gt; or it can</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <p>Actually restoring te above does not make sense, its missing a
      ",", but I dont think it should say "or it can" several times.</p>
    <p><br>
    </p>
    <p>Cheers,</p>
    <p>Alejandro<br>
    </p>
    <blockquote type="cite"
      cite="mid:8288d54d-4efa-9cd0-927b-1a67c0300f8c@linux.microsoft.com">
      <blockquote type="cite"
        cite="mid:b5d45f4c63454bc18c837a6b63ff8869@XBOX03.axis.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
+        be a Windows machine capable of running Windows Subsystem For Linux v2 (WSL).
         &lt;note&gt;
-            You cannot use a build host that is using the
-            &lt;ulink url='<a class="moz-txt-link-freetext" href="https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux" moz-do-not-send="true">https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux</a>'&gt;Windows Subsystem for Linux&lt;/ulink&gt;
-            (WSL).
-            The Yocto Project is not compatible with WSL.
+          The Yocto Project is not compatible with &lt;ulink url='<a class="moz-txt-link-freetext" href="https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux" moz-do-not-send="true">https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux</a>'&gt;Windows Subsystem for Linux v1&lt;/ulink&gt;
+          , it is compatible but not officially supported nor validated with WSLv2,
+          if you still decide to use WSL please upgrade to &lt;ulink url='<a class="moz-txt-link-freetext" href="https://docs.microsoft.com/en-us/windows/wsl/wsl2-install" moz-do-not-send="true">https://docs.microsoft.com/en-us/windows/wsl/wsl2-install</a>'&gt;WSLv2&lt;/ulink&gt;.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Change to:

            The Yocto Project is not compatible with
            &lt;ulink url='<a class="moz-txt-link-freetext" href="https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux" moz-do-not-send="true">https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux</a>'&gt;Windows Subsystem for Linux v1&lt;/ulink&gt;.
            It is compatible, but not officially supported nor validated, with WSLv2.
            If you still decide to use WSL, please upgrade to
            &lt;ulink url='<a class="moz-txt-link-freetext" href="https://docs.microsoft.com/en-us/windows/wsl/wsl2-install" moz-do-not-send="true">https://docs.microsoft.com/en-us/windows/wsl/wsl2-install</a>'&gt;WSLv2&lt;/ulink&gt;.

//Peter

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">         &lt;/note&gt;
     &lt;/para&gt;

@@ -654,6 +654,139 @@
             section in the Toaster User Manual.
         &lt;/para&gt;
     &lt;/section&gt;
+
+    &lt;section id='setting-up-to-use-wsl'&gt;
+        &lt;title&gt;Setting Up to Use Windows Subsystem For Linux (WSLv2)&lt;/title&gt;
+
+        &lt;para&gt;
+            With &lt;ulink url='<a class="moz-txt-link-freetext" href="https://docs.microsoft.com/en-us/windows/wsl/wsl2-about" moz-do-not-send="true">https://docs.microsoft.com/en-us/windows/wsl/wsl2-about</a>'&gt;
+            Windows Subsystem for Linux (WSLv2)&lt;/ulink&gt;, you can create a
+            Yocto Project development environment that allows you to build
+            on Windows. You can set up a Linux distribution inside Windows
+            in which you can develop using the Yocto Project.
+        &lt;/para&gt;
+
+        &lt;para&gt;
+            Follow these general steps to prepare a Windows machine using WSLv2
+            as your Yocto Project build host:
+            &lt;orderedlist&gt;
+                &lt;listitem&gt;&lt;para&gt;
+                    &lt;emphasis&gt;Make sure your Windows 10 machine is capable of running WSLv2:&lt;/emphasis&gt;
+
+                    WSLv2 is only available for Windows 10 builds &gt; 18917. To
+                    check which build version you are running, you may open a
+                    command prompt on Windows and execute the command "ver".
+                    &lt;literallayout class='monospaced'&gt;
+    C:\Users\myuser&gt; ver
+
+    Microsoft Windows [Version 10.0.19041.153]
+                    &lt;/literallayout&gt;
+                    If your build is capable of running WSLv2 you may continue,
+                    for more information on this subject or instructions on how
+                    to upgrade to WSLv2 visit &lt;ulink url='<a class="moz-txt-link-freetext" href="https://docs.microsoft.com/en-us/windows/wsl/wsl2-install" moz-do-not-send="true">https://docs.microsoft.com/en-us/windows/wsl/wsl2-install</a>'&gt;Windows 10 WSLv2&lt;/ulink&gt;
+                    &lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;
+                    &lt;emphasis&gt;Install the Linux distribution of your choice inside Windows 10:&lt;/emphasis&gt;
+                    Once you know your version of Windows 10 supports WSLv2,
+                    you can install the distribution of your choice from the
+                    Microsoft Store.
+                    Open the Microsoft Store and search for Linux. While there
+                    are several Linux distributions available, the assumption
+                    is that your pick will be one of the distributions supported
+                    by the Yocto Project as stated on the instructions for
+                    using a native Linux host.
+                    After making your selection, simply click "Get" to download
+                    and install the distribution.
+                    &lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;
+                    &lt;emphasis&gt;Check your Linux distribution is using WSLv2:&lt;/emphasis&gt;
+                    Open a Windows PowerShell and run:
+                    &lt;literallayout class='monospaced'&gt;
+    C:\WINDOWS\system32&gt; wsl -l -v
+    NAME      STATE           VERSION
+    *Ubuntu    Running         2
+                    &lt;/literallayout&gt;
+                    Note the version column which says the WSL version being used by
+                    your distribution, on compatible systems, this can be changed back
+                    at any point in time.
+                    &lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;
+                    &lt;emphasis&gt;Optionally Orient Yourself on WSL:&lt;/emphasis&gt;
+                    If you are unfamiliar with WSL, you can learn more here -
+                    &lt;ulink url='<a class="moz-txt-link-freetext" href="https://docs.microsoft.com/en-us/windows/wsl/wsl2-about" moz-do-not-send="true">https://docs.microsoft.com/en-us/windows/wsl/wsl2-about</a>'&gt;&lt;/ulink&gt;.
+                    &lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;
+                    &lt;emphasis&gt;Launch your WSL Distibution:&lt;/emphasis&gt;
+                    From the Windows start menu simply launch your WSL distribution
+                    just like any other application.
+                    &lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;
+                    &lt;emphasis&gt;Optimize your WSLv2 storage often:&lt;/emphasis&gt;
+                    Due to the way storage is handled on WSLv2, the storage
+                    space used by the undelying Linux distribution is not
+                    reflected immedately, and since bitbake heavily uses
+                    storage, after several builds, you may be unaware you
+                    are running out of space. WSLv2 uses a VHDX file for
+                    storage, this issue can be easily avoided by manually
+                    optimizing this file often, this can be done in the
+                    following way:
+                    &lt;orderedlist&gt;
+                        &lt;listitem&gt;&lt;para&gt;
+                            &lt;emphasis&gt;Find the location of your VHDX file:&lt;/emphasis&gt;
+                            First you need to find the distro app package directory,
+                            to achieve this open a Windows Powershell as Administrator
+                            and run:
+                            &lt;literallayout class='monospaced'&gt;
+    C:\WINDOWS\system32&gt; Get-AppxPackage -Name "*Ubuntu*" | Select PackageFamilyName
+    PackageFamilyName
+    -----------------
+    CanonicalGroupLimited.UbuntuonWindows_79abcdefgh
+                            &lt;/literallayout&gt;
+                            You should now replace the &lt;replaceable&gt;PackageFamilyName&lt;/replaceable&gt;
+                            and your &lt;replaceable&gt;user&lt;/replaceable&gt; on the following
+                            path to find your VHDX file: &lt;filename&gt;C:\Users\user\AppData\Local\Packages\PackageFamilyName\LocalState\&lt;/filename&gt;
+                            For example:
+                            &lt;literallayout class='monospaced'&gt;
+    ls C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\
+    Mode                 LastWriteTime         Length Name
+    -a----         3/14/2020   9:52 PM    57418973184 ext4.vhdx
+                            &lt;/literallayout&gt;
+                            Your VHDX file path is: &lt;filename&gt;C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\ext4.vhdx&lt;/filename&gt;
+                            &lt;/para&gt;&lt;/listitem&gt;
+                        &lt;listitem&gt;&lt;para&gt;&lt;emphasis&gt;Optimize your VHDX file:&lt;/emphasis&gt;
+                            Open a Windows Powershell as Administrator to optimize
+                            your VHDX file, shutting down WSL first:
+                            &lt;literallayout class='monospaced'&gt;
+    C:\WINDOWS\system32&gt; wsl --shutdown
+    C:\WINDOWS\system32&gt; optimize-vhd -Path C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\ext4.vhdx -Mode full
+                            &lt;/literallayout&gt;
+                            A progress bar should be shown while optimizing the VHDX file,
+                            and storage should now be reflected correctly on the Windows
+                            Explorer.
+                            &lt;/para&gt;&lt;/listitem&gt;
+                    &lt;/orderedlist&gt;
+                &lt;/para&gt;&lt;/listitem&gt;
+            &lt;/orderedlist&gt;
+            &lt;note&gt;
+              The current implementation of WSLv2 does not have out-of-the-box
+              access to external devices such as those connected through a
+              USB port, but it automatically mounts your &lt;filename&gt;C:&lt;/filename&gt;
+              drive on &lt;filename&gt;/mnt/c/&lt;/filename&gt; (and others), which
+              you can use to share deploy artifacts to be later flashed on
+              hardware through Windows, but your build directory should not
+              reside inside this mountpoint.
+            &lt;/note&gt;
+            Once you have WSLv2 set up, everything is in place to
+            develop just as if you were running on a native Linux machine.
+            If you are going to use the Extensible SDK container, see the
+            "&lt;ulink url='&amp;YOCTO_DOCS_SDK_URL;#sdk-extensible'&gt;Using the Extensible SDK&lt;/ulink&gt;"
+            Chapter in the Yocto Project Application Development and the
+            Extensible Software Development Kit (eSDK) manual.
+            If you are going to use the Toaster container, see the
+            "&lt;ulink url='&amp;YOCTO_DOCS_TOAST_URL;#toaster-manual-setup-and-use'&gt;Setting Up and Using Toaster&lt;/ulink&gt;"
+            section in the Toaster User Manual.
+        &lt;/para&gt;
+    &lt;/section&gt;
 &lt;/section&gt;

 &lt;section id='locating-yocto-project-source-files'&gt;
--
2.17.1
</pre>
        </blockquote>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------114DE0F1B1675021898A5D19--
