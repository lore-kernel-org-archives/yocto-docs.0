Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00880C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 14:15:22 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.48])
 by mx.groups.io with SMTP id smtpd.web12.10599.1645712119556302939
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 06:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=FAj0tBMO;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.48,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzDixeNIcB2eoNSkEYvc5P2YokvcL71+wLjDEfJnpYs4NzhnN/DVdb1F+AlPOa/R2AVtk5k75neIEwp+t4WUDMcvtOMbi5oEikPH1MFytd+jCXTR8jPHCweCLmJ5eXf+dzu+plIRKMa4o5nR/KtB0GGT5r1zXj8pXVnbnshGXFQhM6slxc29TVIAr/tjgDwC2FYu+jDKeSQqHuDaB/R5KKkmr5LaeZbtrkQmZnCKA6wbHDdgavjXJXgg6OI2LPCQ0Qg3pazqz7Zk1dGCR/MeciRIkjlW9vNdvEAb5MyUspuyDpVhZSVpdZq5ypWLCzg/qXhlB1Tu1Mup9KBovqd3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QX6B/BdJ47tNCZUG0GwIqQYV90XPH4canwSg9+Iok+E=;
 b=bT+QxyxAak5golJ7yw5z8Nmfo2ATD6gBZ5DVwiG2vY5p6ctBYDrV8sitgdpAo9F9huSuwql7Zlwx8L1RcyDT+id8uVIC4vsKlxGXruNLEdU0Xn2JxnfFKt7qRuF/4HWi56tsa+tQB+EfvHxKaNdzbkQKiN4VBO0rRJz1YcCRmvHFdRMYA6rWce0sxL3ARYPQUuq30jRiDMOYicIqF0aBKscfiaqWaVMDlXUXL9MA1L4WgIBkHTei09RORzhoXs81Wib6WiLgKnvIEhQoRRm5FgXMp6+wINKdjDnxv+d9m+GrwfnPrnR3S/73pPHR5nfE0M7fd2OBLmg4n6O7ly4Eog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QX6B/BdJ47tNCZUG0GwIqQYV90XPH4canwSg9+Iok+E=;
 b=FAj0tBMOxyioKizT8YdgSJ9Y3y68l8ZmhMPCMM9FGTS+Dbk7B6ThUCI7mmmcFQD1c133LsJ85TmFCP90bBDSCrB8IkeHT0Ohl+WE7E6Nlw69v4ohsA6TLiW90PoN9/OKHMcvkfFOxPawHCq7Wm3jfjelCJfjba5jZPpZOTpdZXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR04MB5166.eurprd04.prod.outlook.com (2603:10a6:803:53::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 14:15:15 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%7]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 14:15:15 +0000
Message-ID: <77655f95-2dcd-fd4a-1189-dbac9400422a@theobroma-systems.com>
Date: Thu, 24 Feb 2022 15:15:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] ref-manual: classes: provide command with
 ready-to-use password
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org
CC: Quentin Schulz <foss+yocto@0leil.net>
References: <20220218164950.3277914-1-foss+yocto@0leil.net>
 <48602b31-c72b-63f4-2f42-7ae9ebf38c3c@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <48602b31-c72b-63f4-2f42-7ae9ebf38c3c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0008.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::13) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96c4d5be-c721-47cc-9640-08d9f7a0142b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5166:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR04MB5166F0B1DBE441E4F3A8D8E9C23D9@VI1PR04MB5166.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KMckNqAA4ks+dNmfnVk1TrUyQnnX0aeqUH3SQeG2C12xcSuuilOhI49HSuVj9lrS9QIg3FRiqerSYdEhMq07cK4oFPL5sOI23GMMhUw8AuuIZ3nTK1fdWTJVAIYLv2LCqNJRoo61XFYwCwx1Ts44i+4h/rOyElgva+YRivLISuXniDGbwpm2LXG/GFChCL2RSZRi5lyb0MtGMDsoRing/+aFu1wrxHtvN0sAwFu7AypgdREREmf0dBgEasSIp09u1cWohZYvKJvPjmu+X8ov9De3OIpjeBPxQacEvvlA2AA3EFUeUk901dT5zfdPc9XgaSU++9KT4jQEONQG96Bp588jrknh1vB/qWwWyQD1qISV2AkBNtRZUP6f1Wnq0y8pRCRxGG1NEQm661IhSG9BXSw/AGQL14dRjp9kFaaBqdn7OD0X9EZ4zdxuSWkTUVghwPg1dBxeiyBL50kcNae6aUxvRJP37mB5sf9M/vgSNXOr1GgwXlnouW0oxzDSTXwUc1wIwcvs8DVPeRTEowbYiYvOxl0AoGjEhADOkl5feqPIj9rTDMTihvO2WDYWyvGi65qLyUaC4dXLJ3NEElfYBfxonIAm5VFUyVYquuKI66cxz+ghuMIGFNKZxUMgONTsRCysxOPBlt8iEdv0AjAJ8M6GDnxRai2Q1UwEkCcQTotd/Lot4KH5j3EOGsYWFuBwSwmDOehpewUFtRhJGMzJ7Xoe8Loe4S8BzpEfBeis47k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(2616005)(83380400001)(26005)(36756003)(31696002)(31686004)(316002)(8936002)(86362001)(2906002)(6506007)(53546011)(508600001)(66556008)(5660300002)(4326008)(66946007)(6512007)(66476007)(8676002)(38100700002)(44832011)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5nHl1N34g0FEHU4RLwxgYnv0aQ9ituJ9aVjk8bsPtjHY7IyDwMvJFeeccHTQ?=
 =?us-ascii?Q?POiFH5GAcbl4mshotCLK7fpvxLm738qPmhZw4BoMnNanKDjT0yYXJCU0Diav?=
 =?us-ascii?Q?tts7TgiM6hdyAtP2kq96qk52qumDRiQyWfNlPXT1LhiJAFTJnY+0FO8Ppu9H?=
 =?us-ascii?Q?GjF7mWbwJEuaiFVOac+0wpom/RtcyXCt+Hx3qUwqv8ckH0zSV7exTP3TcYQJ?=
 =?us-ascii?Q?HBwvwYkuXwmaqKfPYlFjmXPm/1Gxdg9SveYtsCMUttqg8GKdJyGFeLmguglQ?=
 =?us-ascii?Q?K+mmeVwjzLb1A+DLL3n/+We9btZFmOtRuHI+2xG3u+6ZUeyVeV2I6Ufyk1ZB?=
 =?us-ascii?Q?ZpcyTsnwCBijC4sMOIuING4ePx+Uf2jlDMbu5BVx8oKwAED9Rxd8nJpwKCc6?=
 =?us-ascii?Q?V95NdsDKlgKXY9fHa09XsLl+AYG0pvsO9xURviAiLnIZJSrg4BoQINcDZWxJ?=
 =?us-ascii?Q?bfb10emQFGiMRJ96QHEBcthzFkLNZ3ircpC0+3NXlPl3v6cgNNhg2ktvelsB?=
 =?us-ascii?Q?W9K5Ki+Ndm/4CLWFLK+PJT1ySIv6KNfvE5bwU3LvIaQQIWzkj0xl+bNSBimN?=
 =?us-ascii?Q?WylubJX03MAIz0P7INaSWlMROaQJTurCJzqY4MDg3HAtT+m4HjPJ7BZ91xnb?=
 =?us-ascii?Q?lCwlyEt7eptlIfMEJ4rs/zAedCJKwWkEER5bCMtJIAnKRyRkwCKDM46jlhRS?=
 =?us-ascii?Q?v1oR83NmHCmM25dWm67TWZ5B7Qe5SSj+MmPJyGoBZRohuMpgUMHEcQ9SZyQ1?=
 =?us-ascii?Q?Y7WUabZlLdNJxVP1sO8Pw0TnsqyX754Gf7BAfUMWcidHVrchkmdm/nHk+VR5?=
 =?us-ascii?Q?Q1QbZ1T4x4YQu/AelpWaHc8urE5WdI3zBSFYEtJ7vQN+rR9fVwCySTkNBBC1?=
 =?us-ascii?Q?5ju0JwqwCfY514eTBvL/L6nrFy51g644AVAqw4FNviprkBHGb9sUiWSNeTVi?=
 =?us-ascii?Q?fDuJOJXIJ5vvPIinJN3Lfq8x47Bd+MLV8955mFD/L8O2kPkg/mE82bpIlrsQ?=
 =?us-ascii?Q?q3V4qJltqaZU40sOzh81p5LNALesZVzHZUm8k6ryMCqPhVkIMlSrDp9/7LSp?=
 =?us-ascii?Q?mwE4OuYKm4VpSC+fcbf/AQ2mVFTQSTMXOIc9XWvDRuo5vMxobW0PJouLRtW7?=
 =?us-ascii?Q?zfExs6F4m4Ul7udAK274RASr8aqOihb+MrWb6EzltBjZieHy3xPyGcWmzMjB?=
 =?us-ascii?Q?5VJNpdePAxIiPDN3y/Q2ZL0ERzQuBq3TvYbEgFSY+2sAYWbTtCWOaWofzZN5?=
 =?us-ascii?Q?asOBAldF9UiRAk/2bBqnpR3mIBU1lEeet1FzL5F7Ti88gY1RIyacSUT2azgh?=
 =?us-ascii?Q?2BD0Mw1LfxE2Sp6w8+CbbiNMI+ZqXxQyYNWjRAa9SYqPRPxlmlOz+d12IkXv?=
 =?us-ascii?Q?D0qSDwKzv2dmnoIWxf4lODf/iSA15Cmo/FQNy0ldiUwCy29B06wS+/BI09TJ?=
 =?us-ascii?Q?OV/CFhvBe+PqDMXwCz9J5ymvAMLrbyyjTOtv2RisQdVGQSGX3wQ0+KIWzUiY?=
 =?us-ascii?Q?rzK+nOEj+3jUeQ+4JTpE0/2O7lP/dMk9FcmBJdDZKoTIR/2X0+Y2yjsjBbOB?=
 =?us-ascii?Q?Wto8qJdEanqVjkI4QPizfRqaAQ7W9SAAnwD8c0pDdV+Esr8aHc1/UTSmKuD/?=
 =?us-ascii?Q?LJMF49catG4wQtLosTo4LDQDwsBFH97CflErRlX61UHeAVcEApWibDXyMklt?=
 =?us-ascii?Q?FvT5M2EuCn9Ntb5r96uDA7YpOk6TEm2CBLueW+Z9bvbjBdk6/NBP4f8PXmZd?=
 =?us-ascii?Q?5wwzmaGGCg=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 96c4d5be-c721-47cc-9640-08d9f7a0142b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 14:15:15.6583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 z/BNVHxF0Y7tcT1y6qDlNJVVTMjV+RK0uFUe1VMexWVkOzaioHasT07UX5Lx9BKbAt1S/3uwpVjcqa7P600VmRam6R3LfuuwpBxlEacMdJu/oYRbcKp23moGeIDvehs0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5166
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Feb 2022 14:15:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2502

Hi Michael,

On 2/22/22 18:33, Michael Opdenacker wrote:
> Hi Quentin,
>=20
> On 2/18/22 17:49, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>
>> mkpasswd output requires to be escaped before being used as password in
>> a Bitbake variable. It was explicitly stated after the command, but to
>> be sure it's not missed, let's give the printf command which does escape
>> the string for us.
>=20
>=20
> Many thanks for this patch to avoid possible trouble. Good idea!
>=20
>>
>> Cc: Quentin Schulz <foss+yocto@0leil.net>
>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>> ---
>>   documentation/ref-manual/classes.rst | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-ma=
nual/classes.rst
>> index 949217bf4..89203dfc5 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -603,12 +603,11 @@ Here is an example that uses this class in an imag=
e recipe::
>>          "
>>  =20
>>   Here is an example that adds two users named "tester-jim" and "tester-=
sue" and assigns
>> -passwords. First on host, create the password hash::
>> +passwords. First on host, create the (escaped) password hash::
>>  =20
>> -   mkpasswd -m sha256crypt tester01
>> +   printf "%q" $(mkpasswd -m sha256crypt tester01)
>=20
>=20
> What about "%q\n"=C2=A0 instead of just "%q"?
> The output is easier to grab because it's on a separate line.
>=20

It all depends. It's easier to grab from the console but it's=20
technically not the actual content that should be put into the variable=20
(i.e. without the newline at the end).

So if you use a sed/awk/whatever shell command to inject the password=20
then with the newline, it is incorrect. If you do the copy-pasting=20
manually from the console, then it's probably better with the newline.=20
(that being said, zsh (at least in my config) always jump a line, even=20
if the content does not end with a newline (it prints a % character with=20
white background).

Whatever you think is the best, I don't have a strong opinion about this.

Cheers,
Quentin

