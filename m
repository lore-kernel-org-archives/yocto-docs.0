Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46563C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 12:09:43 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.136])
 by mx.groups.io with SMTP id smtpd.web11.28737.1737893376822811504
 for <docs@lists.yoctoproject.org>;
 Sun, 26 Jan 2025 04:09:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=lpR00Jrw;
 spf=pass (domain: navimatix.de, ip: 40.107.20.136, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ayo0oSmLV5N4PQ/e4tTMHRwqpCQrht99lw+ksQojk1E1NX7aiT7ISfbkD13iavsoMhuFyLIJ59CwMJqv7RccrPRuBklvj5v9GoytVLRYl/4DxtRjhb9jHALP+FNGjkfj3jHRRJg8RFwZO+HLyL1tdjomjLdSNCYV2cjNmvLhiytqc3FsA8w414kPgWDaoNALzKEXECvIGqTnNT75RCpocjgUIMDf+PNh2vvhu/Kzxc9WAwbyTQze5vXfT/NNLJCzrdifei8F1HD6bVJBy8wP16nbJ4EErwQCL4N7kD5CUJDvEtmQc3CGiI70QVMZ0EqXoeHGQt5VrRrpeOHzJnPFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QK+4ikfCI5L0VHLKS29XhdZRFHDlIHu411u2EWuTuhU=;
 b=tEcXbv3oI53XfMm9ueoOLFc++8Mew5rsKpAdT6fyne60u4IY84qNe/BAmUVR21F6uOyGAfU+aWAQVDscr7miSHL+bUtKdUZM012099RXEeDuRRfJboEgyWW59uiuCEUyjrYNyPsZzrXtIztXWTx7gdLXFa4HqPfLRqm/5aGhrK8pulz5Qf1zm9OzwoNxgALYoXt4eeI6hYllwNbWxO52qdQo+kXTIh7Cy/J60o6anwlL5I1jPm3lMaBcZPBJtP0xh46VVIN4sds7HuwW8OGT8PahwFxpQhNuDFtHfj2a95C6SNDW0T1DAOEWA/OH3OKXatSE1vcP/vJofWXLpOCroA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QK+4ikfCI5L0VHLKS29XhdZRFHDlIHu411u2EWuTuhU=;
 b=lpR00JrwzrqzKqnSSZvF7g3GCJhZMi2xkv3Om4ly/jXFct+oKWoNRWUIob98hMzsRtfxW7ybvQ1fFkkQg7l39vmygUEYpCVcX5E3xwi4ejG0YQRFy9ChHvI4R+B7C/zY3cmii3Bnpee7abVnf55uZ6THcKHTpelfSKGBF5HiZTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DU0PR01MB9576.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:32d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Sun, 26 Jan
 2025 12:09:33 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 12:09:32 +0000
Date: Sun, 26 Jan 2025 13:09:30 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: richard.purdie@linuxfoundation.org
CC: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-5.2: Add entries for virtual provider
 and multiconfig changes
Message-ID: <qrai4lcdbqjhucacdxaucyvu4gjvrqu2q2cwwofxwtf5etfx2w@27cwhi3fqyvf>
References: <20250126111850.2609298-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250126111850.2609298-1-richard.purdie@linuxfoundation.org>
X-ClientProxiedBy: BE1P281CA0362.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::8) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DU0PR01MB9576:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a07ad5-36c9-4082-4b82-08dd3e024af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KSTLP6LIzlAlGWkJZw8+5hUGV+3paE8GhEmcCSey4rL69svZFFHwNCiC0Lgx?=
 =?us-ascii?Q?fV6TVNNEXUZeXfLktnCIOjg+uf8cSd9drA+DADY5Tk1tTA1ECMJfdbP2oZ5c?=
 =?us-ascii?Q?+Yfoi8hhvV2nRIqk6esy46hilVwLC3FXnf6/Qa3n8wTEkQL1LCjOyf8a9FH3?=
 =?us-ascii?Q?MoMOhgp5S6gYv3eZvP7zXHY5eK0EfayTNqlG8AXpWV11TbtSgGKLS/NmWott?=
 =?us-ascii?Q?EwDI4nBU34FFmzskUUsajWFWnrKhmolesYReBSxoOR2y0YthdTWhdsYrbIIj?=
 =?us-ascii?Q?zN9M/7XToIzD/olMl5Spe+Iihb9MTj4jNes+NoujtOngHZ8wSPzgnUlRE/6x?=
 =?us-ascii?Q?fxyQaJhRFFs55eP7igqqnyHH62pwwapoMg9jBZNiLvZt1Rtwf//edxffXHIr?=
 =?us-ascii?Q?+qBCNYOBXKKF8r5ku8kWk0iT5r0zpJRrgHO2HiWSRzjAdHkSMZNb2rsLytg0?=
 =?us-ascii?Q?VyA+FDsxVqrDJuL5mua3D4bV9FasBj60Z3AC7MBFLfpHuszwf2DPN+x9GLmv?=
 =?us-ascii?Q?txU/RP+sRZUSGgCiJdBvl43NplsskwFPwDCfXqGYWDhxWXW7c7yMM7A2GSZ4?=
 =?us-ascii?Q?89WAs/aqX/j2Y7PpeSrOGBpDOjUiDGfThicX+Gbk+JI9ifsx5isuSA+tqOfI?=
 =?us-ascii?Q?Fw0gGxfrjUxQwAMtg4TdkNAOWtw7pbvKvUONoca7HLZi5wET5sNYO2edqf0n?=
 =?us-ascii?Q?874X4Hh8DRfNxmMsGmvQ/EF9uik3SBAZGi+FdcEdhwMnsC9SHa2K2tzKTWej?=
 =?us-ascii?Q?vnAvrBFupjUrYEcNE16GT1UK5cnmyJYtxwkFzJ4PCNdg/x0+aBsu8hPIJIvQ?=
 =?us-ascii?Q?SG6POeOV5mR80Wp4IukX3FVrXRhcE7BBcmf7a7uqF6oxtbxb7PhgFv9OVBcQ?=
 =?us-ascii?Q?XPvb30Hywz6jUN+PUyGFszMCE/SjEZ5/6Z85VVIVS3ZH5ATTmySoeW2MWQna?=
 =?us-ascii?Q?aiIDGSg7EkedPx1PPGZ0EoVxkSGlpCx1EWuNcgdP0PLGdc3Y52AhAhAsm/ZE?=
 =?us-ascii?Q?eSJjxhxjPB04w/HYG7VZudN9724/ucDj2h+9NwrvJ2xfMjzVtXKE3IGCKBrT?=
 =?us-ascii?Q?60Eh2hUWIGAIkt3DeDo6z1BIyAaXcPeHWMKKfcf4srfoqjnvDWUnzyKSqsOu?=
 =?us-ascii?Q?YVNjVlT7kdKf1VS2oVhjpWskv3JZ2U37x6fS4AmKHe4J9MDVmx+f20yBmss3?=
 =?us-ascii?Q?hJGZ5h3098V0j8xEMRx7krQM4vhoT7uQ3rbXQHUGWQXPyjl9X1ocnVtab9Hn?=
 =?us-ascii?Q?dncjNZoU16Km7go3pLjuu7seu68fZegliQpZhL6MfRg5wY7eGNQzrxAnqmQw?=
 =?us-ascii?Q?mKW47BA8zbSjVEDyK7YF7bBz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SkmKuAdZiUSfSBWMTTc2rpu6s678M6AmXEDlSo9NpQbaIrXmNYp/JDt5yV2Q?=
 =?us-ascii?Q?AInwdMTEptrJOMhb7i0Z8CkRKSzNP/IK0lMUuOlk3wk/TcnNalHPmdLSibwR?=
 =?us-ascii?Q?HpanRPfttJuZ891iAnRxMfHJ0GGCrsSHn/7aeJsiDQ12GqGr6zr/yxPbXbki?=
 =?us-ascii?Q?Q1eHhcPcj4fu7HeDSdDGQtlvFzo/VndPZ83rypT03XKbyV95HT2VoPHsxgP5?=
 =?us-ascii?Q?eCCGnSxkBKoN7fFCIRFb9HUo017mj/dzGBF/yRuSkrdDVBrzGLNoAeodrLxP?=
 =?us-ascii?Q?3jJWDYmV9mfEqd1V2oGo2V6BDGk01G4k+kg9pOnmljJdyhbAG3FjunQeKcgH?=
 =?us-ascii?Q?Ns5iDigZEbGNLHfYtR4HddD30K4+cVYWVmxnwuadKDmwEsuvhEqijaJjfRAX?=
 =?us-ascii?Q?eDfqos4WjVvvz0Q8IGgP9JR55Yro6JE1GP0dtLbH5lIlNQuuC/xaGV+QeMyq?=
 =?us-ascii?Q?Ep4hxcdilSvz+g7HOYHgJQmDfT8u/+7o1Tj3e+qdLraCKFrWKzymokR3FvYm?=
 =?us-ascii?Q?+pmLOERW2g1ZHahG7yeyLlLhTjNs9Yb3bEXmxqlLSxA2RIrCGtfSBSZqWW/h?=
 =?us-ascii?Q?OWZYZCidORsFAMomLiUwSn/rjL0NayIo2ORfJ/kIu1R1iiwla/z79wUweKKS?=
 =?us-ascii?Q?EX+2XN1XLqSonbg6dOu4Ygc2jxFfeNd09x8hnZQ72jq/ljRzh70hWICqH0E9?=
 =?us-ascii?Q?OnZn0/qweUDzc2JQLfQugLfY8wk4s/vhlnWA/dZBJ9UqHrk3VihMfxIXYWyL?=
 =?us-ascii?Q?6UMuFVAWmz5zRITSvjLbGZdZSuDGeIeDjp4Sj/s7JNhrdnsJPuGFTqBiruZV?=
 =?us-ascii?Q?rOx4QlmIPAbFfvQZy9WlPwGzn2pgRlnuThrPQSVeNbpCH5l7bRTVO74HSUVR?=
 =?us-ascii?Q?tXnIFi1/5rdmmTtezrcd1AxoWFjkUCbGxv/0G1foYqiM6O0hsgy9aLOwT+e6?=
 =?us-ascii?Q?vIhRchN7dx30RpSQB+ugCTZjEFHSYLUSgF2WFuFEhbtGEKbn5qooewdWBrRB?=
 =?us-ascii?Q?TNhs7ZSsHo+1MZVX9cfBKPbdsPxWSh+yVZbgRBXD7OB+fDmVj5hkxy8W6Brx?=
 =?us-ascii?Q?5SDyrCIaiEnBYRf2BKV4h+XllXizsIBMmz6XESzzQN2GP1K+9FsijRRnVle7?=
 =?us-ascii?Q?EjHNCCvxKrM9o41L7iDmQ/sazMNn/+SEkb3aMZbUFQpcXibr2zYlfnZX7Npx?=
 =?us-ascii?Q?7vZ5YYLE2GHKrdXQ8EXM+FBuq+fxlN8pF8QcRPQrMrkxzJli3B7NfODbmi+k?=
 =?us-ascii?Q?u+l89/yggRqFPos/ipVLNPfY9w3Gy9JvgZS9Mtv/LdLL+hS4C8b60WSCRAn+?=
 =?us-ascii?Q?FTq3+6uV+CxIitORZKA7I37PCp/cFuSXJ8kwvhecK5FZaepL0WwMi2KvppJk?=
 =?us-ascii?Q?Y6WehGM+J08NjdPFpJlWPtcRs2se4dlBkjC61gPuVq8hHRfP+x2sr/I3wuoi?=
 =?us-ascii?Q?uhR+Vwxysg6wDVGszRENrZcuLd7I9xG5EWJ4tI/vIlND2I9SuZsIbYb+oQ1E?=
 =?us-ascii?Q?TmHNH/uo/JNBVjskDJiDMsV3A5sCPhyXfSlYgjx9kVz9xT5cz4boj3FNl+KQ?=
 =?us-ascii?Q?1xtuCSYjCeqCSnUqjtxSdxj0Cx+e3mDE9dnYyiCal7qzSNHSaeOJigmG8mXI?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a07ad5-36c9-4082-4b82-08dd3e024af6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 12:09:32.7573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+DU3TxclBgW9rb3SXyTGgpgWhdAql91V01USkfPwiwN7bJnIdBAvs0jKxTShnYmBtaNSDkta1qE5dkU/qAKdUUt/mWGumUyMVAKHuBXKJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9576
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 12:09:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6177

Richard Purdie via lists.yoctoproject.org schrieb am So 26. Jan, 11:18 (+00=
00):
> Add some information to the migration guide about two important potential=
ly
> breaking changes in 5.2.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../migration-guides/migration-5.2.rst        | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> [Note, I didn't test the formatting of this, I just wanted to get some te=
xt shared
> so we don't forget these. Hope that helps!]
>=20
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documenta=
tion/migration-guides/migration-5.2.rst
> index e9de6910e..fdf44757a 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -94,6 +94,28 @@ systemd changes
>     not for socket files).
>     Now all service files must be explicitly added to :term:`FILES`.
> =20
> +Multiconfig changes
> +~~~~~~~~~~~~~~~~~~~
> +
> +-  The value of BB_CURRENT_MC was changed from 'default' to an empty str=
ing for the
> +   default multiconfig configuration to avoid needing to map the values =
within bitbake.
> +   This was already not happening insome cases so fixes some obscure bug=
s.
                                     ^^^^^^

I think a space is missing here.


J=F6rg

--=20
http://www.gnu.org/fun/jokes/ed.msg.html
=BBNote the consistent user interface and error reportage. Ed is generous
enough to flag errors, yet prudent enough not to overwhelm the novice with
verbosity.=AB

Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

