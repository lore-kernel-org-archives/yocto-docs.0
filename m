Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.3959.1585635926282656434
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Mar 2020 23:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=iOK/atZB;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from AZSP-ALSAMON-01.redmond.corp.microsoft.com (cpe-173-172-201-6.elp.res.rr.com [173.172.201.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 61B6E20B4749
	for <docs@lists.yoctoproject.org>; Mon, 30 Mar 2020 23:25:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 61B6E20B4749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1585635925;
	bh=rWO/bMrNrCJVhh5vJC/hGzRv2VoZd7TW4RZLG9z6L1I=;
	h=From:To:Subject:Date:From;
	b=iOK/atZBXb/IXdhZqmHz7bEqlh/ndwqY3nxZS6pPMFhcLQZMac3qRljRfvT66vSe/
	 PNgvMKZghWDPnnJypHqgggWZ6yKfOlTanZBVoGbtwENW1qxc+JDKdGiVfYvhNKmxz4
	 9GvT6r26+7T4FCeK8+r5araqB1uLhZE9y2GEjC48=
From: alhe@linux.microsoft.com
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 2/4] dev-manual: Document the WSLv2 install process
Date: Mon, 30 Mar 2020 23:25:23 -0700
Message-Id: <20200331062523.296-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
 documentation/dev-manual/dev-manual-start.xml | 147 +++++++++++++++++-
 1 file changed, 141 insertions(+), 6 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-start.xml b/documentation/dev-manual/dev-manual-start.xml
index 8d2f316f52..2dc318a9b9 100644
--- a/documentation/dev-manual/dev-manual-start.xml
+++ b/documentation/dev-manual/dev-manual-start.xml
@@ -394,16 +394,18 @@
         This section provides procedures to set up a system to be used as your
         <ulink url='&YOCTO_DOCS_REF_URL;#hardware-build-system-term'>build host</ulink>
         for development using the Yocto Project.
-        Your build host can be a native Linux machine (recommended) or it can
+        Your build host can be a native Linux machine (recommended), it can
         be a machine (Linux, Mac, or Windows) that uses
         <ulink url='https://github.com/crops/poky-container'>CROPS</ulink>,
         which leverages
-        <ulink url='https://www.docker.com/'>Docker Containers</ulink>.
+        <ulink url='https://www.docker.com/'>Docker Containers</ulink> or it can
+        be a Windows machine capable of running Windows Subsystem For Linux v2 (WSL).
         <note>
-            You cannot use a build host that is using the
-            <ulink url='https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux'>Windows Subsystem for Linux</ulink>
-            (WSL).
-            The Yocto Project is not compatible with WSL.
+          The Yocto Project is not compatible with
+          <ulink url='https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux'>Windows Subsystem for Linux v1</ulink>.
+          It is compatible but not officially supported nor validated with WSLv2.
+          If you still decide to use WSL please upgrade to
+          <ulink url='https://docs.microsoft.com/en-us/windows/wsl/wsl2-install'>WSLv2</ulink>.
         </note>
     </para>
 
@@ -654,6 +656,139 @@
             section in the Toaster User Manual.
         </para>
     </section>
+
+    <section id='setting-up-to-use-wsl'>
+        <title>Setting Up to Use Windows Subsystem For Linux (WSLv2)</title>
+
+        <para>
+            With <ulink url='https://docs.microsoft.com/en-us/windows/wsl/wsl2-about'>
+            Windows Subsystem for Linux (WSLv2)</ulink>, you can create a
+            Yocto Project development environment that allows you to build
+            on Windows. You can set up a Linux distribution inside Windows
+            in which you can develop using the Yocto Project.
+        </para>
+
+        <para>
+            Follow these general steps to prepare a Windows machine using WSLv2
+            as your Yocto Project build host:
+            <orderedlist>
+                <listitem><para>
+                    <emphasis>Make sure your Windows 10 machine is capable of running WSLv2:</emphasis>
+                  
+                    WSLv2 is only available for Windows 10 builds > 18917. To
+                    check which build version you are running, you may open a
+                    command prompt on Windows and execute the command "ver".
+                    <literallayout class='monospaced'>
+    C:\Users\myuser> ver
+
+    Microsoft Windows [Version 10.0.19041.153]
+                    </literallayout>
+                    If your build is capable of running WSLv2 you may continue,
+                    for more information on this subject or instructions on how
+                    to upgrade to WSLv2 visit <ulink url='https://docs.microsoft.com/en-us/windows/wsl/wsl2-install'>Windows 10 WSLv2</ulink>
+                    </para></listitem>
+                <listitem><para>
+                    <emphasis>Install the Linux distribution of your choice inside Windows 10:</emphasis>
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
+                    </para></listitem>
+                <listitem><para>
+                    <emphasis>Check your Linux distribution is using WSLv2:</emphasis>
+                    Open a Windows PowerShell and run:
+                    <literallayout class='monospaced'>
+    C:\WINDOWS\system32> wsl -l -v
+    NAME      STATE           VERSION
+    *Ubuntu    Running         2
+                    </literallayout>
+                    Note the version column which says the WSL version being used by
+                    your distribution, on compatible systems, this can be changed back
+                    at any point in time.
+                    </para></listitem>
+                <listitem><para>
+                    <emphasis>Optionally Orient Yourself on WSL:</emphasis>
+                    If you are unfamiliar with WSL, you can learn more here -
+                    <ulink url='https://docs.microsoft.com/en-us/windows/wsl/wsl2-about'></ulink>.
+                    </para></listitem>
+                <listitem><para>
+                    <emphasis>Launch your WSL Distibution:</emphasis>
+                    From the Windows start menu simply launch your WSL distribution
+                    just like any other application.
+                    </para></listitem>
+                <listitem><para>
+                    <emphasis>Optimize your WSLv2 storage often:</emphasis>
+                    Due to the way storage is handled on WSLv2, the storage
+                    space used by the undelying Linux distribution is not
+                    reflected immedately, and since bitbake heavily uses
+                    storage, after several builds, you may be unaware you
+                    are running out of space. WSLv2 uses a VHDX file for
+                    storage, this issue can be easily avoided by manually
+                    optimizing this file often, this can be done in the
+                    following way:
+                    <orderedlist>
+                        <listitem><para>
+                            <emphasis>Find the location of your VHDX file:</emphasis>
+                            First you need to find the distro app package directory,
+                            to achieve this open a Windows Powershell as Administrator
+                            and run:
+                            <literallayout class='monospaced'>
+    C:\WINDOWS\system32> Get-AppxPackage -Name "*Ubuntu*" | Select PackageFamilyName
+    PackageFamilyName
+    -----------------
+    CanonicalGroupLimited.UbuntuonWindows_79abcdefgh
+                            </literallayout>
+                            You should now replace the <replaceable>PackageFamilyName</replaceable>
+                            and your <replaceable>user</replaceable> on the following
+                            path to find your VHDX file: <filename>C:\Users\user\AppData\Local\Packages\PackageFamilyName\LocalState\</filename>
+                            For example:
+                            <literallayout class='monospaced'>
+    ls C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\
+    Mode                 LastWriteTime         Length Name
+    -a----         3/14/2020   9:52 PM    57418973184 ext4.vhdx                      
+                            </literallayout>
+                            Your VHDX file path is: <filename>C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\ext4.vhdx</filename>
+                            </para></listitem>
+                        <listitem><para><emphasis>Optimize your VHDX file:</emphasis>
+                            Open a Windows Powershell as Administrator to optimize
+                            your VHDX file, shutting down WSL first:
+                            <literallayout class='monospaced'>
+    C:\WINDOWS\system32> wsl --shutdown
+    C:\WINDOWS\system32> optimize-vhd -Path C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\ext4.vhdx -Mode full
+                            </literallayout>
+                            A progress bar should be shown while optimizing the VHDX file,
+                            and storage should now be reflected correctly on the Windows
+                            Explorer.
+                            </para></listitem>
+                    </orderedlist>
+                </para></listitem>
+            </orderedlist>
+            <note>
+              The current implementation of WSLv2 does not have out-of-the-box
+              access to external devices such as those connected through a
+              USB port, but it automatically mounts your <filename>C:</filename>
+              drive on <filename>/mnt/c/</filename> (and others), which
+              you can use to share deploy artifacts to be later flashed on
+              hardware through Windows, but your build directory should not
+              reside inside this mountpoint.
+            </note>
+            Once you have WSLv2 set up, everything is in place to
+            develop just as if you were running on a native Linux machine.
+            If you are going to use the Extensible SDK container, see the
+            "<ulink url='&YOCTO_DOCS_SDK_URL;#sdk-extensible'>Using the Extensible SDK</ulink>"
+            Chapter in the Yocto Project Application Development and the
+            Extensible Software Development Kit (eSDK) manual.
+            If you are going to use the Toaster container, see the
+            "<ulink url='&YOCTO_DOCS_TOAST_URL;#toaster-manual-setup-and-use'>Setting Up and Using Toaster</ulink>"
+            section in the Toaster User Manual.
+        </para>
+    </section>
 </section>
 
 <section id='locating-yocto-project-source-files'>
-- 
2.17.1

