Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A0FC04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 08:33:27 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.84])
 by mx.groups.io with SMTP id smtpd.web09.4844.1666686797428156239
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 01:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=kNN9Ftph;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.84, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+ovLA4pTfjuykXfNfYuE5JSjaXWn6c+tRBoOXhvC2H49ogEnUxZq92ANa5rx0Ia5AMer6E5hmt0HHbZRt3FH2iH4zA0558DkMJr7C/slsxpq9DZyUtsqRczX9pW7poJkpCZroKh6hTApKQVlhsvUJQ9Z1KubSFsU3XRVn1ftckotcv87Jxj8AKE8gejGDLQCTGOwQ5C7k57mPUyarak78uUQZPYXi/Nj1pk4778VbmKcepnERUwMn/kKJrzOgwgclyZhy8F4CbH0v5W3Q/2klxLGR+N9U8T/BSL2dWr5hvXVEdYqGjyX+CxGoRNFUiDI2ECMjHSWC3zZyNwwjYlPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Dx+RJOefwf1SGaftOKal/0oouoec3B1zlcDyb1I0go=;
 b=dz2hX6AD6esGLebRMRU/AiWF3itc6nDpY68QdkBoVhJO7THZZNDsb4BEAeNeRIChKHYV6VtXn/62bJgkLDzNsgN9o9hmSawxVwhlyaSEqTcLESaIqOfBiKExs+/LY282MbgCxwfftvvWoJ9KwCDBbR0QmBHsyIdA16n0ZichZwwJ+cUB3X1j8tiJYat6K0xsC9KG76Z54gLZ5al/yZJ8Q1WZaVgOI0QWJNtZDok7a0KL9PJRRZN+1EQzBEsRyxYE0Bi9kEp21RE7EUo+xeh1siVSkb8c7GICyTwPK2lC05Ey7nIL3IRLMP0a/oyx/jmEriJnnSi/y4nUXRnrERyLdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dx+RJOefwf1SGaftOKal/0oouoec3B1zlcDyb1I0go=;
 b=kNN9FtphXgOmyVviMpqMZjC/iwdktvBpZ8huOwL1pgi3j/njGr6x2U/NzcRtaXjVmUpStoXMFbbS8UfuIjFbdgz3ZNOkOP0GUZDUSgOZTohzCn4GZwlpE/Y0T6Iht0Ot3oJPIvBviQJtM8ycX1XBy8Kz34Z8rH89qYIJj5JE9HW9lUPqAn99KOSRe0EfsgiUUU1cxGjaWtrNq7klzJIi3ZaXCGo5FBbbvgFta7Zc0eJGJbIEFEBqBX7Fea0HyXJDai5NFO5eb33+Aih3n56iuCzMZRcQQdBCA4K7NwHqOYnTXRtkZrqog2ovTsqW466SA9QYfrBdr5UyO7+KWbbmFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM0PR04MB7154.eurprd04.prod.outlook.com (2603:10a6:208:19f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 08:33:13 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 08:33:13 +0000
Message-ID: <d46c5a87-b51a-af3a-1d3d-34b50bcbb5da@theobroma-systems.com>
Date: Tue, 25 Oct 2022 10:33:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [docs] [PATCH] migration-guides/release-notes-4.1.rst: update
 Repositories / Downloads
Content-Language: en-US
To: michael.opdenacker@bootlin.com, Lee Chee Yang <chee.yang.lee@intel.com>
CC: docs@lists.yoctoproject.org
References: <20221025000953.2170782-1-chee.yang.lee@intel.com>
 <6c3c7a21-fb9b-7d5c-f0ff-14c74f2f349b@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <6c3c7a21-fb9b-7d5c-f0ff-14c74f2f349b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PAZP264CA0216.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:237::11) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM0PR04MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 32970eff-4619-4032-772a-08dab6638e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sh/5244W7H8Id4KenvzbMdHxZqSLNSIeDM4XU29Mj0uk7CiZzJIYsEeiFUf0Bo6ptXXGan2wfA8HAcAmUI+UfrUISpR2q1XT2jJMRsKq4Wx1y4hQ2sJkCvS061iMJTbRfv3OxB+H1JBjhLwCbxuerLd3ov6jPgizndIfuLZv4s39WOpTM0bGrWIpXfc7/PyclzMK1PYlXwIZ5HzGgJtNYPEA0IqozDEhAoDgNDAsdJmLiFUC6yE1Cov5EN4r04p52Hxo2UE+dNVHXa5WdvaGV0kH08Ble7lLHKrgm7VhmsrQzQ0ECXPX4VUzdgFpBY/2uFwXvq4dCt1dEyn7FclNXkCbWpK4PoNUvlE4qhK0wG7uQjM3sdW8aT1aNQbtifv4JLQRa8DyTW+L8v8k14X4gkPr+NObkgXswrpqJTQaus8KirbJ/xuv90EqSTkuD/oygreo2wfKbTDngjfUCQsBVO/4Jo73zHHw6WqCLxhSyUACtxGdGdyOhoGs+NsaaxgSGvf21GutbTVdoVEHSWRyGXonkASZ8QKYas67PFQkVLm/vn/2i0yKSgePSXtKbkjvADwHrBFYZ7IJuTzemEZEw/MPhkZ4jugxLLmXO2xyqmVbApKSxgo8FYSMNPiGFpR3c14whPoCdlOjZbsMqNKUPZd641XozCmHLz94/9WzBt5icKjUBvhr8pA7dcBN84pNp70edtR5hMS0LuokDkrD1VcPxFNpPrCfEtfUOh3CKy0O3PJhgLSlCUHNCtJsBOfn/eemTB6eR3wgdW3JvssahhkUfI4xOwVVmYfH8giG/5+SKsUUIAoztHpd/bzfC0Iq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(376002)(39850400004)(136003)(396003)(451199015)(8676002)(2906002)(4326008)(36756003)(478600001)(6486002)(44832011)(83380400001)(41300700001)(15650500001)(6512007)(26005)(316002)(86362001)(6916009)(8936002)(38100700002)(31696002)(31686004)(2616005)(186003)(5660300002)(53546011)(6506007)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1SuHHlqB5HUODNRIJYuoE938lsBiKUVcz8m05Gt6uKOApe1q1AwD5f3hOp3T?=
 =?us-ascii?Q?LbvbSoPQrShvILhCandqi88EH+FtV9HAYFEHe6tvQ6B0f1NAO/qhoKdR4PEn?=
 =?us-ascii?Q?J9mNlbrLtXrO/pwIuvoRLzmKWd9iQMDHkGKTHO13soodODYSloQgVE2SuprT?=
 =?us-ascii?Q?LFuQkKppbWCZmD8G7KeFsZNXTIPd3CqvflUCl9QSjBhwVHQdypnpSxPurk9G?=
 =?us-ascii?Q?n/28ED7O4L4ZJ9eqlMMKk3UxV/dlR6Fewv1rI6F4AbYO/xhJVLEsM8Fs8hPT?=
 =?us-ascii?Q?MFYHkZBpSSRh4xNVIMgtNfzgCcNQL3cs/Zf660r1aAKCfZLGJ5ObnDmGwRfe?=
 =?us-ascii?Q?oq1P83OBnnSFyg/a5uIiyF/9osXWmf8K0rsxw65/aqQLmcGl3SMK50SuoAN+?=
 =?us-ascii?Q?EPpnY7f1uxo5VpilOisGKAFLXiUckr1M/V6gXt1R6TujwhBtQlraFyw6s3o9?=
 =?us-ascii?Q?xM7CxH5TnQx/KgZbXCqm2tbC2QpXTzSk3Ak/DhnexKvnVnY0FP0nk06OZiQt?=
 =?us-ascii?Q?iA3Cd/ALyhNq2MxfwVmOXHydnZgO4Hjivyh3ZPSRTnulnNHk3J7LcReb363b?=
 =?us-ascii?Q?FOSHF8OffJmCRCjGupTc+QNN22G68YnuF4YKOvxtZzv1k+Zg2j3JGuR7MrbB?=
 =?us-ascii?Q?tkjWoJgJaHJ8xDNjWOCbbBlGcfCZn98mG16a27P4xH9tU+/MyYBbnsGOaVbz?=
 =?us-ascii?Q?7P8H1rvDebyRDDh36oMvn2qm1tjyYdk3oXFRXIV5a33zWarknPLN3Tx8ZYKM?=
 =?us-ascii?Q?ENRiBEe6sM58naHUw47ZTqmV/w5Zj+ncuB0zB4C0VGmAprHoMe+0BbleFWmy?=
 =?us-ascii?Q?aI427So8+WRS1Blww7Hc9AVxs3DoqRatMeHMBHWXi3C3I3ht0hf27p7OyC2Z?=
 =?us-ascii?Q?23ui+3VYMCrhzo89F5oll2C1S98vkvneno/7BDwyzHIxazJgbht5GH6CVw5Z?=
 =?us-ascii?Q?wpSy/9lvro7NloEWQ9SP/1l/kLmrudnDChY9e10Wod39D1IoViG03gKci6WQ?=
 =?us-ascii?Q?27Gv6iGahEP5ZMfDqi0Uz2wXmh9JzPDrtIpa5wm8StH/wUn5PznLgtJ8GAw3?=
 =?us-ascii?Q?UCYSDYmIis/5yfD6VnqgOtavCObi3ev3jbT3pYGi0nM4IS2ANLricRv9d59h?=
 =?us-ascii?Q?5gmfv2e4t4DZjs9X1EdhfseGpbh2K4xFcF9xfDy87JY4kj5IOtksPAPjqyJw?=
 =?us-ascii?Q?kQhvAFZuyLyqoZ6LlyQa/aE7SoxUkhyg/IWP7EWWb9y1vOgwIYlVrkgfWPfX?=
 =?us-ascii?Q?R9HowKm/P+AtQWuqR23XUAbt413cOn5ITZWtT2kPEXNx4uRIcicoO5IkJ3Lp?=
 =?us-ascii?Q?joASnXblleg4W9mrLUTJpqZP/wijH7tM+YhWRCRHRFObnfJ3yXfHfNdOju8n?=
 =?us-ascii?Q?AY0+n/bTdXqdZVsZaahrfq8LybnimrP1keXWPOrwyn9o1iod+/Sw+f5Ruz2U?=
 =?us-ascii?Q?91mqIGbyvkYNE4ci85vR+kKYqgTl3E8EATmKAp3R39hsdcBfP4sgUcxr9kWo?=
 =?us-ascii?Q?Q14eYVRUSfSuZQ0gfdTyN/huOYznUGizy9Vt/7S8heeNb7FnOwr8uY5gCeSQ?=
 =?us-ascii?Q?0gDmzVfQ4JGNQw9Q+qFrQTLUZtxtnu6xgrR/QGD6K1gwB6m1Z478SPeUqWcw?=
 =?us-ascii?Q?9U/0/EnpGuuY5FOAQFjEszo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32970eff-4619-4032-772a-08dab6638e6d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 08:33:13.6102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6rp97vyVzkT7HcxMmBL48cFfD6ltY7CsGxKFedtFyqE0KPKoE8qJtsZ+iUcJkAkaPc6Y+Usx5VEPVcGAJfXHfLRALMIpkWWG2pCDMWu5C1qVFe5zXy9E2qMrP3a1XuQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7154
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Oct 2022 08:33:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3399

Hi Michael,

On 10/25/22 10:00, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Lee
>=20
> On 10/25/22 02:09, Lee Chee Yang wrote:
>> From: Lee Chee Yang <chee.yang.lee@intel.com>
>>
>> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
>> ---
>> =C2=A0 .../migration-guides/release-notes-4.1.rst=C2=A0=C2=A0=C2=A0 | 56=
 +++++++++++++++++++
>> =C2=A0 1 file changed, 56 insertions(+)
>=20
>=20
> Many thanks for this update!
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ... and merged into the "langdale" and "master-next" branches.
>=20
> Now I need to figure out / remember how to get the "langdale" branch=20
> built on the website=20
> (https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__docs.yoctoproject=
.org&d=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTS=
qHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DpL3yk6y4FhehqM--3Gn4QeVMq0CsPeRlCZ=
Cl0RDvutaLdGXX7_R3WjeqD6wLa4Ac&s=3DnKS_sRuZOux7gpo56OAtd5kVdG6iIR0FFUfjsLwG=
u3I&e=3D ).
>=20

I just sent a potential patch, don't have time today to make a local run=20
of the yocto-autobuilder to see if the output is the expected one. I=20
hope the RFC patch can help.

Cheers,
Quentin

