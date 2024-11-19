Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19279D6204F
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 09:28:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web11.17034.1732008511600474863
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Nov 2024 01:28:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=B6TsSrr2;
 spf=pass (domain: cherry.de, ip: 40.107.21.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IlJOXhFvMu86nQFvb1YvvP8YxH0JkyrOMX7epAEJXKR0974GhTz3l3WzSD+t6Mmq3OOsMO5CjGJSjoYoyzU3CNu2kp4qVsLDFZVn6staNpQz/BpVkZGNOyAthfGeaXdHegYbqZTCPJJyFRs0dvghlcfWwiIyaBP4pYJxS+xdysH5NW+5qBTqcR9P06y+NcLnmBWpdOBMxOU+wC0OW566VzXdgz1Tii3O0Wd4Kv2lkG4vJxRaUbe44a9QBFB3WuveoPV6B7xFk2jIuGRsd7GFgT4WGQ4bwXHDxt/cazessM7kvIJ+/j/2u1O63146MsG9bK9OQUL/blClIZl9IOQvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oj6EozjWhfsPvVqYZTpRUBxNLfmCLyfbNFuSD3fMGE=;
 b=qWu4QvSg01qekro689UxiviMY4P9/Q+Usgl+v79eqcdUTMJDbtLAmAMmkfWlMGrrzpQp4e/wx7P3lW+uGu7DUn39+o64fZ8vOh+y1gUz9s9U1yomY/OCxPDm2GPiy4vAi4Y7fS29cGT59F14U+w30SFXFWGadoJdEBdYELXuI3vm8T5Tj9wKOZXX548AxfArxSOjHpWqfZrfWFb5Tn+Zhwari/qqoBr3UBc3E0B62YLmugw4ovYHrH5CzEn2uhR657TVjwGfUrIhm84eM/HBvSLrw3vX+W0H0IHZMbEib//+ekZxaK7fwZO776ZHo2BrNWWN4j7bt5mK/c3Qu0+H0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oj6EozjWhfsPvVqYZTpRUBxNLfmCLyfbNFuSD3fMGE=;
 b=B6TsSrr2qBzzGRD2GV17WtFPnKzbl00Wow6PFp5/kqC+A/Km5hipbbM69Gd3NwnFMwFKbPYLd2tliroyyukjG7t50v+fOOhC6gVD4z5QfTTpY9IimGcWUZWsH5CfwVsv99z73o4mhig6lp7eoOtT9XzD4My3KXy3YP0APoI9D3w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB6878.eurprd04.prod.outlook.com (2603:10a6:803:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Tue, 19 Nov
 2024 09:28:26 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 09:28:26 +0000
Message-ID: <299a188d-c7a9-4604-a491-9efb3888e7ba@cherry.de>
Date: Tue, 19 Nov 2024 10:28:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] ref-manual: use standardized method accross
 both ubuntu and debian for locale install
To: antonin.godard@bootlin.com, =?UTF-8?Q?Gu=C3=A9na=C3=ABl_Muller?=
 <guenael.muller@smile.fr>, docs@lists.yoctoproject.org
CC: Yoann Congal <yoann.congal@smile.fr>
References: <20241118104524.25392-1-guenael.muller@smile.fr>
 <D5P93P1O12UG.NQJAUDP1T6Z8@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D5P93P1O12UG.NQJAUDP1T6Z8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: c8de4307-4491-49b2-51a1-08dd087c8546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SZtV2sniQ3xNzoSBYX5BrvrwZhDQxnyGvp+M2NEDyj8J45GOSg4ZIJQVTgVI?=
 =?us-ascii?Q?m9lh9WmTdkvvRCd3WE5Ln4YRBwnXNnIo8Y4sqLOAqS5IyXzB7sW7wJ1CLNuo?=
 =?us-ascii?Q?5cr50yWNso1hVLzkI4ETJKoV/bSn7gtnwo/4xF+JGZVChWIgkx8lsZvMXwLV?=
 =?us-ascii?Q?CyxZTBhGKhSYB2nu7aaYUuEl1VBjrbGik8ny+gN9V0s4DOSvh5AUuayx9v3o?=
 =?us-ascii?Q?8Ep2uZwSMsM3s+LsBPn8wzOkfVUH+ZODxIuC/ZiAmEAIKmAAUFv7W/5kufBT?=
 =?us-ascii?Q?wymdHSqGDHxcUEj5GmW5LRGgKKcMK3/n6snY8v/P0V6xyH0bqqlmMNR/TFOU?=
 =?us-ascii?Q?nhsVT+E51BsBK3wBKpsX4C9yxDd28zXeGQG3C92lKjjsX+qkDhaLeIoyGXjz?=
 =?us-ascii?Q?NP1ZTN9HpiJTbZ5ViXTn8urZeAqtkmukb1j2EqAkHvWMBXcmrEeqkVnG/x8h?=
 =?us-ascii?Q?M3yzevbedd9Huvq95PlvULFU2DJ3HewWNnOU/+qUBXdNBgxqyKKahqmrll7M?=
 =?us-ascii?Q?p8oWTvQyVSfmzP5IhpNFcGQL3ewSVwuX/lJ0kImCNcdbduekV9hA9P95cZJN?=
 =?us-ascii?Q?Jr8IhirrzqxVNLiLfVIAIyP6TdqHzMgFtSyQhzxyGrV90VoII20/uuD8hP0I?=
 =?us-ascii?Q?MjrBg3nkO3YZPgmovNVUSamlaT9jykYYgsuYVpVBxQkszpAWg5NYVBhWiIYt?=
 =?us-ascii?Q?O9Vc/v3pJicVX9EFHbsqt9e9x4U687rjTFRF62a1omYWPARE7t6zSdI5zjOI?=
 =?us-ascii?Q?mj+NvzXn5xdm7sPSz75aOZYPzI3vSyuUurf4g13pCmtuWaVwY3VXzrBxNwtD?=
 =?us-ascii?Q?7Wz86ftHL1ZHe51B7E2z6bJ+L31NwD+RwZYFpY2WfLNhfpte+fo7qWryGISz?=
 =?us-ascii?Q?45EQW4wIaGPsLpUGQhQ+ypw/EY7yeQmh5RNm1tp3YVFTRxOTzgtag53faXdc?=
 =?us-ascii?Q?bo13h6aSZDAIFIYWEUOXjl75u3zvondteZlIu8FTdECA2QvC5iXwYqBrZWWo?=
 =?us-ascii?Q?xCxTHBaQLSKU1pz3Q3WH+hCmy2eYBBfLWo7ifdvnPWrcoMaejwv/154Kqkwb?=
 =?us-ascii?Q?cpVoU583oH5zZhv4PNAUoLyGEQVAs6ZsHUrt/Vq+Qmjrfi4U8o9pP9DElBh0?=
 =?us-ascii?Q?iTF3Z3uenMSpRtaEafUB4nX5BDXpx138j34l2rLzOjT9vz+PH3OapONVKLF8?=
 =?us-ascii?Q?i3mIJJW8sGs0ydOG1SUP8rrgVUaZSoYFloIrULp63jwx+N69XEz2eTA8x8pd?=
 =?us-ascii?Q?a3/ftCUkh9hbNM9cA9wrOP6KGrBHim2FFmhMoo+mjndHeTGaU28FQ7o03RpW?=
 =?us-ascii?Q?p5LF+lnpEgJMlG1kcqdNXESX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yh26pgDapX9H04KyQh49i0JPlrBjbGBAwMmrRPhWV09TCO2bFqFLiBghTUpf?=
 =?us-ascii?Q?ZZ+2VITArxbjpjVDyHbwKTAMkNo1iJChzzmrXqUniMf1bzVGf/9f1oGEEk6L?=
 =?us-ascii?Q?PN7EqJeNqRc/B9Ve99+d2nxnSiqbFZfNXYqMrGz5HfjJmfhWJhgx5BtqKYBX?=
 =?us-ascii?Q?dEJ/dbrwqvHNkQNnJsZlCHna9Wq4ynniK4yZgRpSNt/s1RSdRgdE+YyNq7ZI?=
 =?us-ascii?Q?WtN0RNBeCoEiTKQEi8whMacn3u5ZYpSk1P4lI65hoOtZ4tJvBHRMtFiUAHFq?=
 =?us-ascii?Q?NAtMUUOg1n/3Y9JLJbXC8SsUpigUV6G0EuLURwfTLqnrY7JmRwlTEDKWsyg+?=
 =?us-ascii?Q?DCxm/TRdMfOUyGiEvKMWfnC6KvYgXeNKrKa/2xKhpB1YvdHlXSIL4v6lmj9J?=
 =?us-ascii?Q?bthfUs+XUhZyXHeNtcpLjM896YyUJg4kKmE6KZzEF1rAl7hTg4kIDiK8Zk3i?=
 =?us-ascii?Q?dBSLWxmzRtqZq1UV0Ng+yrhMxyVVnue651mGjio/nioizHsYGpSD5QE4ydz3?=
 =?us-ascii?Q?rRWY4EII/dOzculse58BBvTlIjVnQOgXsnqECRBWEL0No2HGYj/GD/c+YaTr?=
 =?us-ascii?Q?ymETwIPbaDOJ/Gw/2E2ptC0kludUnZApdVyI29dn+DNwESdou4//H7v8OFEY?=
 =?us-ascii?Q?I6UHnznG6BFRR1Q3HOR+eBvlJuK4RZPargY7VKLUhZWR7TF4F3RkmZoaiMlv?=
 =?us-ascii?Q?TilLtfwWj8gESZcwlOpU8tBtgqImZ8xaQIrkhbWl4fGdimdmoT3i+pGMGEGs?=
 =?us-ascii?Q?LawOqxOCOEGyM43/wHigwcWoODUjL/2htjN9Ak+3BfB5mkQ7frSNz6h+TvDS?=
 =?us-ascii?Q?WZDnTzZucrf5y4ReG6WXjiT5qRLJHQmD/RrQRY/ZSeVWL4SNBpBzgMqzgAoV?=
 =?us-ascii?Q?HHe07sZMbpplTBp8bRJLwv/P6ivXHIL+cwz49TC/X7OVtdDwSN/C96rdCkp9?=
 =?us-ascii?Q?3QLJt/nFNRtgi9PACafiQ5xtb18BmH2+mmXj8iIctwSNk2YhO27vTPcDSMnN?=
 =?us-ascii?Q?1+a3lM9/weTBpF0/lNr9KZw1NsgyL/zVdO8Zv7wyB4NjicJqmoihPCpcW3JJ?=
 =?us-ascii?Q?Gg08DFA7V3cEWEf/UNk1ie+HKhoxmkgZIzhZExD/+yBB/W1kuWY0Loxdk5kp?=
 =?us-ascii?Q?5iZ9KIVVYVgjPKkUlCzCJYEVoTB1Pe2l2PAOSk6NM40FHOzQmJ0gL6531NRp?=
 =?us-ascii?Q?9WWN6CmBrJ/ySJSlLvDMqdeOMSixRWeikMyL0RX0RHw5Z7FDZXsM6FtHQrjz?=
 =?us-ascii?Q?Zm5I52TMLvLZt/IRbTXvhlzLkpVOExSXousweCyusCcQpKwMaHQUkSwt9M+D?=
 =?us-ascii?Q?PIRPooJyeQ3lK3fwXbU1RwAo7A1Xv2TWbq6XIiMPO3+8GX1MIr+5JoyuJnfw?=
 =?us-ascii?Q?dtm0vASDiICdCPJ7CyvhwhN0WV47eg5FbPLASm0kFA07e02cGzJgVk7gBKRB?=
 =?us-ascii?Q?nOQkX3Upn/nhhxErJpn+/yR/IYyD60TxNI7ufsd8U3j6vNzCfcAwVi5fYYM8?=
 =?us-ascii?Q?wHfeIAIZnlmKkDSRuL0UECkahzp2KIRc8xc4I9mpDjcpn0upeW2jxIccp5VK?=
 =?us-ascii?Q?prvr2Uv9ISOo1iSUBuHK+Itbn35hOqPuQixaDX1CZ936XfMU901M9X3NQo5v?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c8de4307-4491-49b2-51a1-08dd087c8546
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 09:28:26.2750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBd6rAg9iGF8nMW/R5iwHv51EJIxWplrSmrKj9N2hV+va6NfwZMqXJU3WKBT2trfaT/EtBCCI29Ls6KAUWjqC6uhLF1VI2VJ6YrnlgKNVbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6878
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Nov 2024 09:28:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5765

Hi Anotnin, Gu=C3=A9na=C3=ABl,

On 11/18/24 12:00 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Hi Gu=C3=A9na=C3=ABl,
>=20
> On Mon Nov 18, 2024 at 11:45 AM CET, Gu=C3=A9na=C3=ABl Muller wrote:
>> Modify locale installation method to be standard accross all debian-base=
d distributions.
>> Pre-existing method is available only on Ubuntu, locale-gen tool has no =
parameter in Debian.
>>
>> Signed-off-by: Gu=C3=A9na=C3=ABl Muller <guenael.muller@smile.fr>
>> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
>> Tested-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/poky.yaml.in                       | 3 +--
>>   documentation/ref-manual/system-requirements.rst | 8 ++++++++
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
>> index c770318f2..66f758fe8 100644
>> --- a/documentation/poky.yaml.in
>> +++ b/documentation/poky.yaml.in
>> @@ -13,8 +13,7 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/=
yocto-&DISTRO;"
>>   UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo=
 gcc \
>>        build-essential chrpath socat cpio python3 python3-pip python3-pe=
xpect \
>>        xz-utils debianutils iputils-ping python3-git python3-jinja2 \
>> -     python3-subunit zstd liblz4-tool file locales libacl1
>> -     \n\   $ sudo locale-gen en_US.UTF-8"
>> +     python3-subunit zstd liblz4-tool file locales libacl1"
>>   FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python=
3 unzip perl patch \
>>        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpat=
h \
>>        ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue pe=
rl-bignum socat \
>> diff --git a/documentation/ref-manual/system-requirements.rst b/document=
ation/ref-manual/system-requirements.rst
>> index 0fc92550a..b33518c7f 100644
>> --- a/documentation/ref-manual/system-requirements.rst
>> +++ b/documentation/ref-manual/system-requirements.rst
>> @@ -152,6 +152,14 @@ with a supported Ubuntu or Debian Linux distributio=
n::
>>  =20
>>      $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
>>  =20
>> +You also need to ensure you have the locale ``en_US.UTF-8`` enabled::
>> +

I believe "the ``en_US.UTF-8`` locale" is more proper here.

On a side note, what's the actual cost of reconfiguring the locales=20
regardless of the presence of en_US.UTF-8?

My point being we could probably have this command in poky.yaml.in like=20
it used to be?

>> +   $ locale --all-locales | grep en_US.utf8
>> +
>> +If this is not the case, you can reconfigure the ``locales`` package to=
 add it::
>> +
>> +   $ sudo dpkg-reconfigure locales
>> +

How does this actually generate en_US.utf8 locale if we don't explicitly=20
add it somewhere? Are you sure it's not because your system has LANG or=20
LC_ALL set to that locale and then calling reconfigure it regenerate it?

Also on a side note we tell people to check if "en_US.UTF-8" locale is=20
enabled by grepping for "en_US.utf8", is that expected? Why aren't they=20
the same?

Cheers,
Quentin

