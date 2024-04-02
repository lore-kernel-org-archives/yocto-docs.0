Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9BCCD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 07:53:49 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.125])
 by mx.groups.io with SMTP id smtpd.web10.6927.1712044418997800633
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 00:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=A9xiNWUW;
 spf=pass (domain: navimatix.de, ip: 40.107.249.125, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Evr0MEBM3AFHvir079qn6IHs0IjQyeJKiujSYcZnyTHJN/UR2P07HHq7ZH3yOwvXX0sXXsiaJgx0SvNT1/vXhwAvvhD/SKkacx2Q6/CDyCs6hi+1vTblJrcBz+oAUiJfzPTZj3cDSPyEtaSGAP8auQNDf4ESqZgSolbXGsZc464fGXUKzj3Z9vWLT2YE7jM1v6KTjafm5BuHuqdc+HozdVUXfMM1fTbcv7g9gGIbqutk8TR++1drrFDjhnVZD0SK3/D0j+wyXKJr2El7t0pj1hPemGmLkCtIj1/OSlqKjkB43VtUUzDQB1PNKOpum+ktu1Wdte6CIzio55yyvuvScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGfm4QH2RbbP7P3WphkdKxRWQt7bYquJn/XTfuAbzBc=;
 b=eaeyWXAD4dSwpA29iKfKww7n7/t+XRm6kfUmV1abrQYRXiUv/mO36Q2XPBFNiStRuibDMBZE2nbUOG8+YUim2fV8id1DPzG3KCfqlmUPbHjR2dlupYmh5uqvUWbYhQGcTFZ238tKF6+amOX3MVhTGS/iCI8ahHLeuM9dMuTdJUBmHLC5rGjRH+AhybaClb3rmSeroRiq+rsXbdU2iu+sWcnHeplvAIRG/IzU73GOR+5SnJRkn+RAt5s5QzVVilkaGDLSt7liXPP8/Yqprrj2W8qjQzIlyeK31QWJunbzx2bSYC/PKdBkNoFHW8kqYtmNSi2ujclHyp4YKzM37tERsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGfm4QH2RbbP7P3WphkdKxRWQt7bYquJn/XTfuAbzBc=;
 b=A9xiNWUWQbsSMxCnbzyK0lxdQROa75AP9X/l/6XjRc+eNboB2SUfIEzBPS1ZmYd+b+zEH9gdWwTlPogzerjJbidEA6tKiQ9L03wwH7M75/0S/X5nAVspF+pBgLgRcnWbJlIpNyc2oTbWG/3ehsrj0bJQAFbYZSAu3UyickP5g84=
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS8PR01MB7192.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:25d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 07:53:35 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::b064:fa2c:a00f:55ef]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::b064:fa2c:a00f:55ef%4]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 07:53:35 +0000
Date: Tue, 2 Apr 2024 09:53:32 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: michael.opdenacker@bootlin.com
CC: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: add initial sphinx-lint support
Message-ID: <phnvruxf73koyubpku2axrnpil6nxkfzdzuwxda3tnxeqblvsn@tielnvpiz6ja>
References: <20240330163609.1735506-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240330163609.1735506-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: FR0P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::14) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS8PR01MB7192:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BavbCc+j4k31OZah/h3zEzHRZyNFQjIrMau/3+pQnLVXBjEPVHpwXFCuqax3AdZ/dJRp8JKysPRtbU/rTHTPD7oc8PBLdZbhauoR3pzYooRIUQXg3o8M9RkvU8X9JCQNbOl84PNWiESoa9kaEYvelkOv8EbpBQkkzE8XNPN4i1GvCZi/uC8G/H/H7Ln/3CubZ9+PlXMjO90HpdBOi8dtdnvvNm3AsI2lRYrHeNZKipFa91XInkVLSEf30FkjUswxC2SOXcaSvxR/9lGcXGmLYfwGM0xjoRyj2maH/2GpM210NNfmZbhq81XMhaPON3WB7ao6NZu3L/MGUM9toMbCpgb7mo4vEaa4GMdAVs8973SuDEV2vMPTfJZfpoeEdPRZor5a8QmhJEc2EW/qt5RflRVM3AInk1zc5WmF34wxteVNiMQmk4HdnUNfe6W4zGXMM9cLTbjLdrUX4GBVlRWN6F/JZPeSZluxE0IpEYWhKtRqG5LmWgm+AmHaMeftB6TRdT3YWUkz+BlwcvvcxR9YqM8lpp2ASQgmyDmvkHmyKdt1Q8X+KF67eA4gc/BF64yO2xvra8+rFKqi0/llDHlJGeDa3x3PKTjcNy9fd1kBfeW3QCMWsKUxM8P77zSxZWkUOE3AxZ2nj9aWQ36vUcBfjYBiQ5NbUfYeosr9IweM+M0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hFxJ44OHupdFplVoLlxez1JOzHdVwA/6zrmnlQOEDW4PEq8oynEUun0z0pjI?=
 =?us-ascii?Q?5owN/xvzye1k92ycOyfkAG8FDiE0OA9gGqeY04qbITNC5stCjab5x1pwjxuG?=
 =?us-ascii?Q?ouu6w4g2SBjKt+Z2YXkqlWeUyByD9D4RWxLMh1D4SImVJT+nz0XOmW6OiXCA?=
 =?us-ascii?Q?EpbaGN7EC2Yf1igZep0QdsDVWdW0UVHdW9loYhcRMClz1kbDFFERkbBMnuPr?=
 =?us-ascii?Q?yWawmpIkPgjebIoPjQ8M0PEQwvtRd4QNhNdQEumyoXVyFhgMx9ilmBd16c7O?=
 =?us-ascii?Q?vrjoL2/WOQOH1l0a5qE6nxy7v5PLXzFH29zVy/crH8trX+86SJSbFdaa7P70?=
 =?us-ascii?Q?6y0WWsJKwvG/Gv+7DnFPOKN2Fw8qW6txPH/kRBTL+/w5gIkTlMPwKMuwG/aN?=
 =?us-ascii?Q?iym6mdsU++hPfj3qmwwnfUIXc7GY1kt2tcvDNPtYGRQzHXQAO3Tuy3wnCDEG?=
 =?us-ascii?Q?Ssx1oUE9cMKx+SuaEGPHnbdVQuHXBLMh+pQqT+0etjI8tk+3m/H9snV0U5sb?=
 =?us-ascii?Q?wFKgT1iFpOzcGDEDMDblskt5dWZDm1OoYDGSvdW6k4fJWVPvErnUJgTMaztA?=
 =?us-ascii?Q?vgdfTrJMl1yaSySMVE6CagJz1NwklwcWzGHRNCpZDL8YwIUXVbyaBDzOl98O?=
 =?us-ascii?Q?2UmEusPHtkU8RfLjGGqbJQXnFp5YsW0kJSRdiB8C0tH1CXI4uqcS81LK71Lo?=
 =?us-ascii?Q?yllqymUkgBmXz+xydkKBAPHZVQIMvS4p5GyyJ2aR/LsU/0EjgYQJxBJeO+g9?=
 =?us-ascii?Q?HtU93xmjmyoIfz4yCFTvR38TEyZ1kPTv0u+Dl7nhw06orWAnteLzPaSxTeIy?=
 =?us-ascii?Q?dwDLRpevbeICEQxxHBu2xon7vSTgWmZNFFYqSBfTZaehXrjImX3ErmE5I1kf?=
 =?us-ascii?Q?FKyEhxoQH7fpyhQlrOjZO7PyZTgK8XcKg5OBkR6yxQzedoy6uQR6rhLa1i8Y?=
 =?us-ascii?Q?0CpVowFfEtUslVHO3iDN3koGiphsE2gj9FTTgQF7am8yY76QINtuabV2ZtHr?=
 =?us-ascii?Q?lCOJyq4db+vXV+wvFotTywru2wnemgWBRv5ktJ9LcgQz9m4Nlprh0p+7FVo1?=
 =?us-ascii?Q?a1FRlADi4FmwchdmkJycwykTPILllzzOHaahYasvXdEPclLfk34CqKFixFoF?=
 =?us-ascii?Q?l3xP1CxLgD0CQKBz1XOyxuaT0WGPmAzlL2ZtfTXGwThNk/T0XsLJmYls448u?=
 =?us-ascii?Q?AVztRoLcdFG3a7KLrK1al6titAAFrtv7dD3m35/ja8AJXYxmXoyAjzMFplzM?=
 =?us-ascii?Q?lm2SGBGxa7B5Av3xyIgsbavR8vI/JkpM3eFz3oO9BBLex4SxKYjhOcAV4+kS?=
 =?us-ascii?Q?vAWtRww/8Y9ZiK1YvEsRQ1D+pYK5dc9YxlxozsWLsY3bYzBt9/TRjr3zjbjD?=
 =?us-ascii?Q?WQqmBahg/I0NMFPiHKBxZlHLoMRaA97rOURrzASkTR26FDVz/dmi8nxYaRcy?=
 =?us-ascii?Q?FWS8m+383WuIQo+imB/iyEqmwUejzPyAoth5Vl+AzhKsXVVbUkjOwVkyWGV5?=
 =?us-ascii?Q?dBD1fgM2E7cRWh5w5/9IOeZ0IISAs3uEX91TAcX/EYHgeLq8vM0WHibz++PL?=
 =?us-ascii?Q?mm5oliXHpO/WPSVu6/VqVgfwLv/vteNku0mIblC41BmFWmRQJ1rvsReQ4MCw?=
 =?us-ascii?Q?dA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 19842ab7-ecaf-40e9-de66-08dc52e9ffa2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 07:53:35.0497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVPU6/exoKHqIFv+Jmjo57xNgOTqZEqYPVtVc4D3V6CD04hTynIDGXZjXMZS8f83sA22ALJRiJJt/XZrr9550IZ+WJaod+HO9/KICGFcvMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7192
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Apr 2024 07:53:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5039

Michael Opdenacker via lists.yoctoproject.org schrieb am Sa 30. M=E4r, 17:3=
6 (+0100):
>=20
> Just run "make sphinx-lint".

> +sphinx-lint:
> +	sphinx-lint

> +To run sphinx-lint:
> +
> + $ make sphinxlint

Is a dash missing in this command?


Regards J=F6rg

--=20

