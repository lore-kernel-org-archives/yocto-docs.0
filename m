Return-Path: <jdeivard@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD01CFA44E
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 16:03:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.79])
 by mx.groups.io with SMTP id smtpd.web10.1245.1729699387509020693
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Oct 2024 09:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=VhrMEknE;
 spf=pass (domain: outlook.com, ip: 40.92.91.79, mailfrom: jdeivard@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKWOwtBg0w1YGHgJ6D56Ysy8ZYtvGc1laUSt5ut+MIfHuunjoXRWlzTcf7adhXDSV+FmRLCzdVw8bO93+qo4/RhbZuiGbFzAzMtMbQT4scKhz8rJJgGVBlOJjFnsJzv0ekCo8tQ51rOBIclagBr2vbtaSnmiBEGPsIZluaB0D2x5mEoUAgvOxL12aHmL9LW5wNZrPNSBhX9u1VvWoQxZOo5yk5i2RlW57ATkQpnpnoyljjMy4ovohNw4mEBy9oRVy29XJJ6+W68RbE5gj8/onIQ95zYmUhKzpKShg5xciuEfRuwts14QIhJxsQUgdcCOk+PyA0tDtllkn1c3U+YwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fZgX9/xitOOk7omViqspKiw+dKiagKQQTDTIfzo0hw=;
 b=ihd9530eo4ktDEwoY+k8YmgIn6Hp/JGhNBm0JvSOUajANUX2VOfVKTsWMxbjQ+vDqNILp+JYRaGEPQUP7YpdygZzOrxifGzwOVBtW4Vra5vzk1O4q2daDNkdVCGy67vX3oxmTq2/4r7H3NWB30hbrs9pe+hiRmENFsayBplVty8GY87qi3nK7EfWey4nXt8eDpnlZr7D0srmrU22YB/frJz1WJaQLZA40z64dn8IVaI5hyFBdBLzAyJRAwLDvZ4c6kB96a2dgzRhpqDP6gzVMBacalpgSZhHt8uyCnZLePhd5G23RwX68RX0zLqS89lN88+//pi90SwNjlpSBHvmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fZgX9/xitOOk7omViqspKiw+dKiagKQQTDTIfzo0hw=;
 b=VhrMEknErNZXe00ptbp1D6HPs2ZNfT/64mgjZEwlUJrsaDcZWIcfWRzQfognHyZDU5phW6F26pfaTZt+H8HPwU29Twob92dDRYBZkbPUf09iZprVY+ogcey0ZaUN0GdfpajQHCq+z04BvSoWUh5OzS9z9pNegzN47CRzSbjivY8aAib8dsvuTI1oNZxiARWkA6SsGgWDo9P1aejlOwlz+oArst0PlOMOKa6R7TxjBJH5NqUhVCTOUa3E/M2xO6Cf12Wz54pdOM/QTYH/7ltStUhHE2BhGAnyXpVp9hWCgZat60w1xFeu4//O9I5DETz7YuoYW/R50B54sW2qSOCe4Q==
Received: from PAXP251MB0225.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:207::16)
 by PRAP251MB0685.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:290::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 16:03:04 +0000
Received: from PAXP251MB0225.EURP251.PROD.OUTLOOK.COM
 ([fe80::f951:7e02:93eb:d658]) by PAXP251MB0225.EURP251.PROD.OUTLOOK.COM
 ([fe80::f951:7e02:93eb:d658%4]) with mapi id 15.20.8069.019; Wed, 23 Oct 2024
 16:03:04 +0000
From: Johannes Deivard <jdeivard@outlook.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: BUG - Optimize WSL2 VHDX file using DiskPart
Thread-Topic: BUG - Optimize WSL2 VHDX file using DiskPart
Thread-Index: AQHbJWTtg1PAMy4gJECOzLRtbz1ZXA==
Date: Wed, 23 Oct 2024 16:03:04 +0000
Message-ID: 
 <PAXP251MB02258F3DDEC28194AE141371DF4D2@PAXP251MB0225.EURP251.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXP251MB0225:EE_|PRAP251MB0685:EE_
x-ms-office365-filtering-correlation-id: 70987cbe-5df7-48cc-2b2f-08dcf37c2d3e
x-microsoft-antispam: 
 BCL:0;ARA:14566002|15030799003|19110799003|8062599003|8060799006|461199028|15080799006|9400799024|12050799009|7092599003|10035399004|440099028|3412199025|4302099013|102099032|1602099012;
x-microsoft-antispam-message-info: 
	=?iso-8859-1?Q?JhXYTGbRy5pmJKUMExW9uRL6/bIHYsEJV56GPJitNM1etwvZHYpKQaGZfd?=
 =?iso-8859-1?Q?hUQnP5U/xT8Unxoj34WAeyr0bALpHikSJmQ7+c38qoI3+jWu1bHJNqL95Y?=
 =?iso-8859-1?Q?clnonDATxxboxmajRjYQzEcHZkVgLWfANq6gdrWddtnE2Q9MTmN3R4qsNJ?=
 =?iso-8859-1?Q?sFBOtaWBGvy0hnZqVcjCZ5ZHe/Zm3/PnyBM1dlBca7SLcIlk/KYhgeS61Q?=
 =?iso-8859-1?Q?0sFt8JCgiBbVHXfhbfh26CgmtA/Dv6UAIWufTKCdpwnmMLh9O//YhnLcZC?=
 =?iso-8859-1?Q?O3P+DPhRpfULKcoU2Oi1LGz7IWW16paB1qshlRoMwzwpzISM/Sn16Jl796?=
 =?iso-8859-1?Q?bnO+HsSdyo+KESbXLHW2aYD4goqcCxW/z7WkX68Lp7xdqRZSM20JucBoTj?=
 =?iso-8859-1?Q?grExohKJn2LRTiQaNBXPD6rJL8pJ4K7S/OnAwZW3sWf9VFPw3SXmti1e0P?=
 =?iso-8859-1?Q?b+/t/Ot0a1ZkzaARf4FRS9OIrUqnPU0sVJo/KuXwV5/CKdBgbLjmBmqFzq?=
 =?iso-8859-1?Q?otrpvZ2qt9FNRV64FTqQMDyJj1YxCHSP4XACL4XeSVbqLRu5nhNVosIcd/?=
 =?iso-8859-1?Q?KddgK0fRuoWMhRUWLmabx5DM8fXztaIaZvsnLC6kTndAgWagzHQPNQ5hmg?=
 =?iso-8859-1?Q?EKTBVcMyM58DgPBsLZpYmBCge921aHaIGeF3hgYlYqHZjR/U7i5PT3NevH?=
 =?iso-8859-1?Q?0VmItJc4eNxaAk6WfJXvkkj2+ddknx5AYOLGo5YEZMi6B3h0X1YDMVUec6?=
 =?iso-8859-1?Q?HTehi+HHdKp2eqJppObHh46J4qBHFE1QtNMsY7RlunQEx49I/ib8/Ax+cf?=
 =?iso-8859-1?Q?rNj2tBNC0ru0ETRw+jLDg0/JajRAMR54EN4tNKWGT4MTpZjKnM1aamNI1S?=
 =?iso-8859-1?Q?yrakDwvIEHMFM0vTiivDRbQOE4Vv37FHcAaOGx/Td1o2VJ6Byc97zP+4yh?=
 =?iso-8859-1?Q?vlY2yBA502vH6irxofOiuhn6IcEGSYaXUnxhjkro2jvn8N1T1tmlDA=3D?=
 =?iso-8859-1?Q?=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3LSd0bnpTT/VeJRSsFgx6JhWx3by4NR3UsYmb+GVXoXUpmCTm6A8g2OVa6?=
 =?iso-8859-1?Q?9teLFfKcZU16/l0LqsAWXtecencdUufb3XvaYHrJfMfmL894RJvkuT2M2b?=
 =?iso-8859-1?Q?H0j2FUnlUHo35AERlRwvzcV2mj15CdLI+MpyKbAILTy404Xi86HILvSmHF?=
 =?iso-8859-1?Q?KDnabTmeUedbRcLb5ihxqtL33Bkm5ul8KjcARteyplXIXMaaP4lfCQRMJO?=
 =?iso-8859-1?Q?Xr3FopcolTk8DIjvfEzNKcB51CUED2girCJDHb0JQEyOtkw1R3EZb4oNwW?=
 =?iso-8859-1?Q?4+gNPB6/fGsQT5ULEaU3MjYtL+ghww3fAqgSCeSkyb2yY3A/GGqCrnAwXq?=
 =?iso-8859-1?Q?sJfv4TdFrwPt2SevINm3ED5fPUYlwaJYsJHFHx1xwvKjs1+eEmVsLsKvVz?=
 =?iso-8859-1?Q?sw9L1hhpOj68XM5I3imwm0qDDN4oRoqVRwHfUF4uR0C/QZSMM26aMEc57o?=
 =?iso-8859-1?Q?vdW9jDixib5z7re7o+UInpn12uY/ARtbSJDPrcNsIPbIjpJmQh57GeubeN?=
 =?iso-8859-1?Q?8b36tgEfo6nWh+bSoddWiFxv8G+rcbwzENO2TAl4X3EsJEe1CBmSCZktCI?=
 =?iso-8859-1?Q?tb5PJ1G/JlWMLiUhTcWgYq5lA/UE6WVAL0rrG2CZ0FBpsRi/VFxh8twZnq?=
 =?iso-8859-1?Q?LZqSKsfIiQWJLvP4ZUAGzl4T1BrM+3Q+3YJ7BbX3Sp0hxnC3IBOKVImVbq?=
 =?iso-8859-1?Q?WLP8ofLrehyByDw+sb5RDZP4iuxwJzgJsQDFlEme0Fr439rCwxrDXzlJ6Q?=
 =?iso-8859-1?Q?53lA5rwsaiFV5K3prPvXpNaCQc1A4K6iPByiK5TZQdTSPhAIq54z1IA43c?=
 =?iso-8859-1?Q?uun7XA/ZhpkvbwIIyyiOZXPBHs8EjG3w4wpVzClIIrjwHK2OYShWz4UFax?=
 =?iso-8859-1?Q?sxPlhwm01xBDJUEFOLhiRAucPzgYhkTnfpZoqmqN2Cgq+qgJ3lwRjbe9KK?=
 =?iso-8859-1?Q?IYfAgQnwNR07jzbusyafaiJ1lnfEPPMnE8if34yubkQlZ9Unj8BMjxZ1YS?=
 =?iso-8859-1?Q?SAwMrj9ZpCkxz4OmiqDc1waZF1PbE/SNoBdH4D3C+ZxC6HHOiFKdCpDTcs?=
 =?iso-8859-1?Q?nWDO31Jy/OFDUoPe1DJqAAHw+Nv+Si6/Lb1sLbbq1y0RzVg+alQhwHa7gz?=
 =?iso-8859-1?Q?JOmLnx204nOTjK//J9o9k/eEzIshp9m2N7GngVbW4MtEutsQz5ToZ+NROW?=
 =?iso-8859-1?Q?k0vjf5//YsL3h3Bqyi+Ch4LVXeZXHrYxQ67Ye20TJqZ7WPztdE3GRvNf5g?=
 =?iso-8859-1?Q?2UmwrZolQBKjHGdqKHNg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PAXP251MB02258F3DDEC28194AE141371DF4D2PAXP251MB0225EURP_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXP251MB0225.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 70987cbe-5df7-48cc-2b2f-08dcf37c2d3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 16:03:04.0227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP251MB0685
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Oct 2024 16:03:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5575

--_000_PAXP251MB02258F3DDEC28194AE141371DF4D2PAXP251MB0225EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I would like to report that one crucial step is missing in the instructions=
 "2b. Optimize your VHDX file using DiskPart<https://docs.yoctoproject.org/=
dev-manual/start.html?highlight=3Dwsl2#:~:text=3D2b.%20Optimize%20your%20VH=
DX%20file%20using%20DiskPart%3A>".

The attached vdisk must be detached before diskpart is exitted, or you wont=
 be able to start WSL2 again since the VHDX file "is being used by another =
process."

The instructions for this subsection should be as follows (detach vdisk ins=
truction added before exit):

C:\WINDOWS\system32> wsl --shutdown
C:\WINDOWS\system32> diskpart

DISKPART> select vdisk file=3D"<path_to_VHDX_file>"
DISKPART> attach vdisk readonly
DISKPART> compact vdisk
DISKPART> detach vdisk
DISKPART> exit

Best regards,
Johannes Deivard


--_000_PAXP251MB02258F3DDEC28194AE141371DF4D2PAXP251MB0225EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Calibri, Helvetica, sans-serif; font=
-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Calibri, Helvetica, sans-serif; font=
-size: 11pt; color: rgb(0, 0, 0);">
I would like&nbsp;to report that one crucial step is missing in the instruc=
tions &quot;<a href=3D"https://docs.yoctoproject.org/dev-manual/start.html?=
highlight=3Dwsl2#:~:text=3D2b.%20Optimize%20your%20VHDX%20file%20using%20Di=
skPart%3A" id=3D"OWA3d9464ad-557f-d3ca-86f4-ccc4479c6145" class=3D"x_OWAAut=
oLink" title=3D"https://docs.yoctoproject.org/dev-manual/start.html?highlig=
ht=3Dwsl2#:~:text=3D2b.%20Optimize%20your%20VHDX%20file%20using%20DiskPart%=
3A" data-ogsc=3D"" data-linkindex=3D"0" data-auth=3D"NotApplicable" style=
=3D"margin: 0px;">2b.
 Optimize your VHDX file using DiskPart</a>&quot;.&nbsp;</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Calibri, Helvetica, sans-serif; font=
-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Calibri, Helvetica, sans-serif; font=
-size: 11pt; color: rgb(0, 0, 0);">
The attached vdisk must be detached before diskpart is exitted, or you wont=
 be able to start WSL2 again since the VHDX file &quot;is being used by ano=
ther process.&quot;</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Calibri, Helvetica, sans-serif; font=
-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Calibri, Helvetica, sans-serif; font=
-size: 11pt; color: rgb(0, 0, 0);">
The instructions for this subsection should be as follows (detach vdisk ins=
truction added before exit):</div>
<pre style=3D"background-color: rgb(255, 255, 255); margin: 0px; padding: 1=
2px; display: block;"><div style=3D"text-align: left; text-indent: 0px; lin=
e-height: 1.4; white-space: pre-wrap; margin: 0px; font-family: Calibri, He=
lvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">C:\WINDOWS\syst=
em32&gt; wsl --shutdown=0A=
C:\WINDOWS\system32&gt; diskpart=0A=
=0A=
DISKPART&gt; select vdisk file=3D&quot;&lt;path_to_VHDX_file&gt;&quot;=0A=
DISKPART&gt; attach vdisk readonly=0A=
DISKPART&gt; compact vdisk</div><div style=3D"text-align: left; text-indent=
: 0px; line-height: 1.4; white-space: pre-wrap; margin: 0px; font-family: C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">DISKP=
ART&gt; detach vdisk=0A=
DISKPART&gt; exit</div></pre>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Calibri, Helvetica, sans-serif; font=
-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Calibri, Helvetica, sans-serif; font=
-size: 11pt; color: rgb(0, 0, 0);">
Best regards,</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Calibri, Helvetica, sans-serif; font=
-size: 11pt; color: rgb(0, 0, 0);">
Johannes Deivard</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" class=3D"elementToProof" style=3D"color: inherit;"></=
div>
</body>
</html>

--_000_PAXP251MB02258F3DDEC28194AE141371DF4D2PAXP251MB0225EURP_--

