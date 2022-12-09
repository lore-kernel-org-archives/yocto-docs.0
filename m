Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B311BC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 16:39:04 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.84])
 by mx.groups.io with SMTP id smtpd.web10.6290.1670603941016833186
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 08:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=SaACXubc;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.84, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdxmXOlw0OcX0WEAAIRuRh+K1imjPgLCJa6vR5ySmsZ+FdYP2C5wTJs4fHmuDx7FSAh4eg9KThSbSRtOucd39B24/NVH2hs6o7m41eB8f6qlSUyPG5w3JIEEYbqnCxzk5xzVWT0s1vBcsma8ECKcd1elWTDc/Fhz7T/fBigztf08VouL/pZsN3BvDRbbaunpXCkQ4jZIQ1z0afuDzYdNn+DUBx5gvdncshZvngeR4cjG4DMf9McSc5SCNupqcGcsHlctnwmins2QGNA+ymvsbOdCquJg6ZDJcocIXV/CcJGT/qNpX3rKcjUYt0rS9OBFA0Vm4tOc2ca71B3dVAsAgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KR1/VSG5QbmxVhZzyy93gjoPN/tOqHfQb4VpGa1pv8=;
 b=Cy6XbrfN6/KfM3ugL+qeFAE0hCPGUl23gAGtw3HWx51J9UrO+dkJXO0Q791BWfb+9rcUG2Dqv7cDPlfjETIH1FO9b4F/m3Y+5MAtr6roBXff6nKYuAGMk1XYaUG1JtKG6eH2hgpl1CY1D2V4thHQxRqH/pXYlbAzjukkeB07PuzWPsiNI+5+XxZiy28EXX8WWJxX2Xq7qIO7JEvUIB7yGdD1XGuA0frnpFiEW5HCA53bN7Yyo0AnkoPk/6gZzxe9zxhdSloECkLtc1mw83w5j08uh0sTVME//MLnDo5KO0gHCShsjndu7Ay8L2phBhTlkGCMsVkZO6mzPxVPL06+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KR1/VSG5QbmxVhZzyy93gjoPN/tOqHfQb4VpGa1pv8=;
 b=SaACXubc/T1ybvcADy3tA5/orHe5Sl5VVLethBQ5Ayl8VbmdY0o9U8Z0bCfCp9nUUEgjZa9TA6R2XASCjQv88fULs46SkUGgRRnDzZC3V9amYoDWu3FmS5BPECXVsGuNyawYtbSWI+1kjH3ooGHbXi3kIP1VBTnJcIotZ41mVGhgwMq+ksvOKIFmpIpKa5/HmkL/h4rRhiWzmkiAWYcx4Vq1fN9ZY9r3dfnuSMva1ZS2ZM/w7QBn6p/9CKAKDcGDYg7Agm2gqD2lrCpt2tlHNToEjGdH/lR1hpa6aR+CounvHF5lTYkIox1MNcXioYAMejldn42YMrnkNwu5svhMwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM7PR04MB6999.eurprd04.prod.outlook.com (2603:10a6:20b:de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Fri, 9 Dec
 2022 16:38:57 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%6]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 16:38:57 +0000
Message-ID: <4a4bc51a-f4a0-bf06-9234-b8dd8d0f2bd3@theobroma-systems.com>
Date: Fri, 9 Dec 2022 17:38:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [docs] [PATCH] ref-manual: update references to release notes
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: docs@lists.yoctoproject.org
References: <20221208151610.20370-1-michael.opdenacker@bootlin.com>
 <0238be8d-2341-45d5-dd5d-ebfd1ea1ccf1@theobroma-systems.com>
 <f1540530-9eeb-fa58-a60c-93e1ef8e8d40@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <f1540530-9eeb-fa58-a60c-93e1ef8e8d40@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM7PR04MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce03dac-c435-4e76-a2be-08dada03de15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2LeEWcktxOFKUr6IwWKgoBYOjSpUSBj3y1ZMrP82q3zXHL29bNocjnLNMo+SC/8ghBC5W2kHHectInyii32oxjq7QK9OoiJ7yoEvtyAB63W4uzg7KgsFajXVh9GFV4gt+kWu76VCc/CHhO8glkMoJd8ekUS1uOUBM2AJrdh8MLRO7E3XDZQWnFkNUXsAPJD/clA+1v5nMzX/ySlydJNfBrno8zBWXtHCFpg3LVfY7AoPJXE0X18kdOY2rNiQzcJccCSxENx7T4IW43BYkZ3yKPkq7AGNsRVBtc316n40SuTJVcWjLnv4OjmfV+2K0ooKDFrzTClt2hHOqLZ5aAmL7jpyGhFMcZc4NyeJWqFSvo9NpbBFyOmIoaQCRtayKg4olvuziHYtWfKCLMCHujKPP2riVt92Ijw00BuNECE6CRyLz/Mh6PrfM4gGauC9XOnQQKmf8ZeHgmY7AnnlWb5KHDkLq5p5TelZJ9GwmdgXg1tEBUKbiuVG2CspmpN1CjJ7E5YDOdsXKljvJsNyDdy3QVuMI1j77VjOkMTb4Hz/t5+V6K1Mgecl3dgPQxLXtgdur6YowWKiR4lFA1kNb+nxDmkwQ8DH/5Mjg5cYyaPT6B1pLhq8MdLT8FJqYfLmhobSOgVEZCj0Dlt/FjK3MFHoBspy8itvRfqVC4qZdrFPg5SZaIuDTfzAT29TiE/lCLIWR+zmmCfy/AueMexcy92mnL3mhE23J2EpaGI9txvs1qA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(366004)(136003)(39840400004)(451199015)(8676002)(4326008)(8936002)(86362001)(66946007)(66476007)(66556008)(31686004)(5660300002)(41300700001)(2906002)(44832011)(316002)(6916009)(31696002)(83380400001)(38100700002)(186003)(478600001)(6486002)(6512007)(6506007)(2616005)(53546011)(36756003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j+1qYs7AqV0Hoa4s3RARC6UU+i2cIROelz2eOa2oJsSL9iEf0cKPxq1DPpf5?=
 =?us-ascii?Q?UufySYqBL9hrke6pgpVBYuqN90wOEwyC+bBdkXkGid1w+D9BOkWpWHwm3JPz?=
 =?us-ascii?Q?ffeImj11ruuyGoWB260EBYbTKyfb7UxfclaAbnJx5kxZvXoK1cPRBg0zOA5F?=
 =?us-ascii?Q?N2k1rtPkMNfP2XwPpskQwkH6/Vk3/gzo8vFk3Xc9PqBkyxMLrvIaoaNw4X0Q?=
 =?us-ascii?Q?1pSEjfdXzLoPlnSlqBVutpl6t4AVZdMZgSJlHRV8KtfwUi7InMntFQWsIaUf?=
 =?us-ascii?Q?2rr6l/RKg/hENAW/2PpvNIqoecg2QUkzwY58p30sATrTsxl3xAEV1905E7hk?=
 =?us-ascii?Q?rcOO/HeoiZh+NXfQOdpKVR6+UgpdlFYbUPA/6dvXUa/k06NchxYXtQdNAqzZ?=
 =?us-ascii?Q?rZN+rMyoSjNYpfRC55c+mXXt4VRSZr1kcIngrfl2sXEqwvIe3/CsuuMC8DCa?=
 =?us-ascii?Q?mKYh4AaWRThfJk5RwAwBU0l5dosJyp2/kIrnLV0PCab7XaTJJToJPlWH3gU3?=
 =?us-ascii?Q?PIOREvm/MKgFdi3PjNE4Z0BlzAoXuVOylDxPmN3kNpXrqpP1lzLd0zSaUZ1I?=
 =?us-ascii?Q?mo37HOpmGZ6DUVCdwaubk7tfYywDPH6tQ96C/YUSsx013+3mcqKxf1+u2TGX?=
 =?us-ascii?Q?m/TKyDxFyhitTBT+e0yTw26UgTd1Kl/tMBiRiOcIW7blXvXSxaIxEavrxxkZ?=
 =?us-ascii?Q?qpiJN8bmaw1HYNSdo6hvzpcFx0VSvFFiH7+wC22/9TOYWAt1OmOhFWhz3Vis?=
 =?us-ascii?Q?5//nDaF/JDCybV0sSuQwwGppNXc6l0obRw7wvUL3sMzOdVWuml1DVwGd0K0l?=
 =?us-ascii?Q?XUe8V07Q5hxfcRq+je3y/25cgSrNNl/gS08ZT8sWbI+OtOagpjOvuvxBm9U6?=
 =?us-ascii?Q?3PhwWINGB6hvpqxhsyFmqUvbdRmZ/zQvDFTY+/3ZOMVLbWM1gKLsoI3FaQAk?=
 =?us-ascii?Q?sGiAM4Bv1vSSZG9CmUvJyPiS1K6BZ2DJegePtqTk5r4sh1ZBXl1zZV0n4V+C?=
 =?us-ascii?Q?REc8lwVanZIFOUap1smC3VO6b0Id+9EqMFeI1Zu4EoIaXId7Slw0qoup8Zgr?=
 =?us-ascii?Q?Il8PixiMnX5WodEgF3uiEIAnNmN82yIQTrXpWbNRmBBZtR4tlnVBYToLl+IZ?=
 =?us-ascii?Q?2Fx6QoGydzXVzyjlks36h04q+yTUe1xM7TOt6Sf+B0KfT0bO7iPT7Ad9l4bY?=
 =?us-ascii?Q?T5xSgkc+rJCHNYdjCBzjxoNIpQDN5KSrAIEbUsigqzE4uFQGUsd/13qG0iSm?=
 =?us-ascii?Q?TLpxnXckx37XdbVeaWDnxx7tosut+Px2XjmdpXw2YcPx/35yhS+q30E+BRGl?=
 =?us-ascii?Q?NsFIEEgKTNDIQm1CnBvcFL8u0SoqCqjmvnlvHnqGwBBaVYWTb9skLwLwgJQC?=
 =?us-ascii?Q?AfNApTa4l4OEviN+xv6+dgw7VGC5Jp7IOGajzTQ8O5Y2TB5MfWTC+ixNv0IG?=
 =?us-ascii?Q?L741OAHhz0QUjW7CqPSPNamjEOsjFJh15jXZtNQEyl8NlPAclVjBQtJCkUBj?=
 =?us-ascii?Q?21ecmX19prqV+OTslQC7y/HfyaHcFzoV6RLKaRtIY94pCIWIbYaA2yin/vbE?=
 =?us-ascii?Q?tH+/TUv6DUGJUnCNXWuMP/Zt0eSLt4qzEuOS4X25+DMmio/3KEcxcyAwpcAJ?=
 =?us-ascii?Q?dxkYuAaYeTpCclP9QBAH7nw=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce03dac-c435-4e76-a2be-08dada03de15
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 16:38:57.5188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2m/+FYdAotHRGpZ+sFh+apDZYEGc9RMOUzr8iZMwasdDtAEzqDsgPr2SgmQShMuNsCPbAcapxcXyznYjJUpq4WMnsndu07jRcjd4aqxz+NmpDen14ptnNEWwAXDuHNBE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6999
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 16:39:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3541

Hi Michael,

On 12/9/22 16:22, Michael Opdenacker wrote:
> Hi Quentin,
>=20
> Thanks for the review.
>=20
> Am 09.12.22 um 11:05 schrieb Quentin Schulz via lists.yoctoproject.org:
>> Hi Michael,
>>
>> On 12/8/22 16:16, Michael Opdenacker via lists.yoctoproject.org wrote:
>>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 components might caus=
e build problems. See
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :yocto_docs:`Release =
Information </migration-guides/>` for=20
>>> your
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 version of the Yocto =
Project, to find the specific=20
>>> components with
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 which the toolchain m=
ust be compatible.
>>
>> Where is this info located exactly?
>=20
> Well, information is scarce. In the release notes, you have at least the=
=20
> glibc version which is supported, and sometimes but not systematically=20
> the supported gcc and binutils versions.
>=20
> Shall I say "where you may find the specific components..."?

I'm just wondering how this would help people if there's no actual way=20
of knowing the specific components or their version.

In the end, if there's not more information than the previous location,=20
I guess the patch in itself is fine and another patch/workflow/process=20
can be put in place to make this more helpful (if even possible).

Cheers,
Quentin

