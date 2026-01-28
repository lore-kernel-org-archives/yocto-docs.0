Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516EED25926
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 13:55:43 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13698.1769608537888154324
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 05:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NDmeg0Ea;
 spf=pass (domain: cherry.de, ip: 40.107.159.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYntPAV6Uqiz3n0qRsYm/3kvv3a8Gk0kd9kTs7oosinBicVaBeK1Z+8V3umHBfcHMTEXZDR/JhiZ2sdalqO4jqVJevXpN6E3Ubp36t/5E56cr318aoKQbZU4Uqow3jmFvbGCRlC8Q298lekEa/AxnFlootQ41lgotlk/rbEJPr8l1XcSrY9XuuixFf6BFKfkB52OsoHkeRLP6neiFTLLoxoZCePf8tdoXmiievhyNf3OheqW9F44Y3Q/0abkoDorT7mKbyP0AV9ppT5r6Dp7sGRd1CrknQi+jdQjnUM3Ov47z2wywJS11pEkb43CbvM0L5sTW+tx7u3B2aJAytaXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6jhuVI8H7c7e/0VODIEx+oaiWxXMBu5j+MAw6wBRtc=;
 b=bcWIhU9088m984iY6T/PDLtfhVVFN/sIn0ClAHwhaqhHguJM6JQ3sSwxXuKpYNUWFxmdVUANt6RPOtXUyQlzaUIFgLRfo8rOBHyagFoZGYOQliYjF8FkwFSGdgg0HqukgP+u2kyfNPkNLUb3dgKLbJ1b+JAlzF4IFgvouDzjVir197qXWWHKe8cysr6pEmWMEBMPZ7pA9XKIreg7T0ryt+DGtG8sJGaS7TlRy1jAwqO5wMVucz/R+2n1uA5CACBveRk5y/vAykSAavscHn6f+SrGQpo3uChAklhr8fLWH0/UbE2Z30/C7Cpl6x4eXhpWaTMlgxPBqbRv62L7yjwSFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6jhuVI8H7c7e/0VODIEx+oaiWxXMBu5j+MAw6wBRtc=;
 b=NDmeg0EaSqtkn6PTkKZbFLMYEpie1YoEnwPC83K2VznlBGIKS5wX3lbpqpFMgCImnyI9mxqxIrRBXv8x0cKq4CB07KRvWkThHemZKJ11zFj6YaNuNVT0SrNZECYLlm9bJ34M1RSo2r7Kg3Tc81e6qPT9nI0zFqP+DkK+gck/eGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB8154.eurprd04.prod.outlook.com (2603:10a6:10:243::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Wed, 28 Jan
 2026 13:55:33 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 13:55:33 +0000
Message-ID: <bc939f16-c738-4bd9-bc94-dc41b3d00b35@cherry.de>
Date: Wed, 28 Jan 2026 14:54:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 39/56] dev-manual/licenses.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-39-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-39-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 33af7b9e-a309-4196-8812-08de5e74e7f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dFlGWEdsb2tMT0ZPQmlMcFJRVlIzN0tvNUJyeDdrTFFVN3JiRm5wb3RZQys0?=
 =?utf-8?B?TWp4UVBtOUVubUd0dnREY1FKaXljbVU0VlhHazMzaEpYTWd1cm9OWjhkTlBq?=
 =?utf-8?B?RDFaeEpqTTk1OHlVUnVEeGtrOW52ZUc3bUlyUHFFTVNVTVVwc0tRU2ZtRFpp?=
 =?utf-8?B?Z0RtcGkrdEtDTHQxS1UyRjhEL0I0dzQ0VEMxWFFYK3FYNFM3SU9VYlIvSU5q?=
 =?utf-8?B?U0x3QTJENkFNY1RFeExva1RybTJDM0JVWDdibzk2L3FSQ3pGL3RKTVZSNFRJ?=
 =?utf-8?B?NkQyODFaazc3SHR2MGU4ZExVdjM5KzNRMzByb1NWZTExWGIwN0tORmkrYS80?=
 =?utf-8?B?RC8rVjhtdUlGVG5SU2c3U1g1dVVqM1MrK29FaVpCZmQwRHRMYk96SVdvMTE0?=
 =?utf-8?B?dGlsSjhhRHp6TWhxdExobitpNWJLME1Rak56RWpwa3p0QmNsT0haeXNNV09z?=
 =?utf-8?B?UGNRL3o0RGdoMjRXRWg4QkFzTUhJMnM0c0h3eUpROGRDZjZhZnhheWFHVUM2?=
 =?utf-8?B?K2FNZDQxVXhPKzVQWTFYNEh4Z25hYTM3NW1NS3ZyVGdJWVhVNFo2YXpXeWlZ?=
 =?utf-8?B?S2laRXFMS08xcEMyWmhsQ1NKenV2ejZsQitsZGZuWTROWFcydkVpVEphTGpM?=
 =?utf-8?B?MUZWVVpJMWJhUzJ0Rlp3RVU1a2JMcURjYWwyOVpZWktvMUJYTTlYSDZtcjZy?=
 =?utf-8?B?Uk5pQnpYWE9pQm9nTzQ5NXdPTjF3bWloVzI3L1JqbFFJMGxCdjcwUjlIOVcr?=
 =?utf-8?B?Z2laZ2x5SmhWaElDZW91VGkrRnNWcFltUnhkeWJMSElRei8xZ0grcGRpV3RV?=
 =?utf-8?B?NEFuS3FJNk1DZlhCYVpKMWc2QzloYWRMS2lmUjdjZjRocmkwRUJBNEdyWUE0?=
 =?utf-8?B?TERRTzRDK0Mva2FhdFl4NHRoY0YxNXBLS3JHOGphQzcvSWJnKyt1dEdUZWR1?=
 =?utf-8?B?clhUM3FYNjc4V2doSjdrWU1hZ0xDRHRYYUNsdXZrZGRjZ0dERmNZd2F1VHp2?=
 =?utf-8?B?TDRJN3FoZUV3OFdWdWV5aVRtaHB4OUlqSkhBSEtNb0habWVESmc5ZUVkQ1c2?=
 =?utf-8?B?N3FQYUc2RGFjb3ZrWUhaeEpxQXFWaUdnTGMwQ1RpQ3BsWXRBMURGNCtuZUR3?=
 =?utf-8?B?aGVrL3dYTkhNZnRRenVkaFNyVzA4em1JZ0hOdWlRRkJqZjQzc010d1RhekF5?=
 =?utf-8?B?SXBZVGVobG51VXE1N2xaNWVUbitYK1Fxa0F6Z0VMQWh4cm9jbjB1N0tiY3Vw?=
 =?utf-8?B?cFlFTzYvMTRhamx6cXpXVEs3WHZTNkVPbmlYRjlRRVJYZGRuanFSVFRGSSsw?=
 =?utf-8?B?Wlh0Z2FQOHlCdW1EL2lCcEpnUzlaWW9udFREK1Vkc0dkNUZxczVPRWVlZ2Fa?=
 =?utf-8?B?S3F2R0h5N213SWdrc3hvTDFGdzRhWSt6WDR0SDNIUUFOUmlKUDRrSHpZckd4?=
 =?utf-8?B?SWZ6UkN6SGY0UzNyYm1iZ2lCVFhubzlmNHlYRWVpMi9IcG1DWnRzQjJiTHNT?=
 =?utf-8?B?VG8yZE5yT1lDbWtQNE9OUC9Rb1NUNU1xTytMdzY0N3pjUzFRK3l6MkFCSHZn?=
 =?utf-8?B?OU5SZGRIYmYyUm5sZmFGUnpYZkNiQnRsbnNUTis2TVZMTkQ5WEd3S0o3bmtQ?=
 =?utf-8?B?RDFMT2h4T2hXaTZCMWI3VmdPa2JCVnhoZ2NPc0p0YkJINTBtNXhScFdZWmJx?=
 =?utf-8?B?L2trUUFaWjlOZEEyck92MnAvL2xvT2paU2FUNEM5cEJxNUVKTkdUQ2hnakta?=
 =?utf-8?B?NXFXYXNnUmVMamppM1RNZDRSNGZVbGs2OGJmTUxBQytPNW94djRFTjhoV3o2?=
 =?utf-8?B?OEhnR3ZTK0ZiWi9aUmFaS2kva29QTlUzNVlBcHh1Ky9scjNHWjhKblo4d2VF?=
 =?utf-8?B?cnRBZU02YVBKMnBLNE9nK05NUG16d1V3Wmc2OWtDL1FOT29yMXUvQllLVU5k?=
 =?utf-8?B?WVZKT0EyejIrLzdKWDJOcEN4L0hDL2F1VG55WUxRamdjNS9ZdHovYlFNTEFk?=
 =?utf-8?B?Qm9UaTc5cVhnbGpDSDJYQ1A4OUZLa3RvYkFpQ3d1c3llNVdtcktrRXArdU9W?=
 =?utf-8?B?SDNPSFptaW9yUVlZMUFoQVV2aGZobFFJT2NXbzFxWm9UQUx4NDRMM1NVSEJ4?=
 =?utf-8?Q?8JM4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UDhDSVVuMXgxM3pHSms1WktHUXlNc21GcjFIdGJmT0FFODdCdUFTbjZxcXFt?=
 =?utf-8?B?ZFJTUnB4c2xFQ0JLNTVPaEh6SDYrak9JUmF1UGUwU2oxNjhrbnZQc0QrSEcr?=
 =?utf-8?B?aFQ0OFBBdGx3djMxOEozNlM2azBnRXRGTldNQmY4VlFWUUYvL1Fnbm40OVRq?=
 =?utf-8?B?TWpCdjV2YUdXd1Z3V05mUG85YVdPelFaNTg4V3JVMGdaaTBDZThrS2s2VkNS?=
 =?utf-8?B?NUo1RlZTWGdLVldhNVQrNTEyY3U4RzlycGdMNkVncHpyZjl1V1FjbEs0RGhN?=
 =?utf-8?B?ZXI2NUJlQWZIMlE2NVBuWmhsUEc0QzIrUFdSOHVreWFvUTd6cGNtT3RHUEd3?=
 =?utf-8?B?YmJXNmtOVmpEM2FPM3V3blUybnhzK3NZRk5tb2p5OWxraWpNVWNkYlZVNXlp?=
 =?utf-8?B?VFhDL2crL1BxMVFQaDUwMUFWaHdWOStUczFSOFpzbVgwVUlhMEFoS3M5cW5D?=
 =?utf-8?B?UTJvRVk0cDlJMXAvTW5GdENiWTkxRnp6T1IrTHQ4alhJajlHK3VIcStBUUo3?=
 =?utf-8?B?MXA1eEc4eDl6VnNYV1FiT2U3cVJqR241aGVxM1lJbHNWSk03cFdqdklrUDRw?=
 =?utf-8?B?RFZmMXhaTWo0WWkxaWVZTm1oYkxWMml2WGFIUXdXeHR6aC9DVGlwQzk5SXoz?=
 =?utf-8?B?UmdGeDFSenNqcC9XdlRMYmJwMFJLSWg1d1BrNkpHMU9YZ2lmWUZEYnBIbW5o?=
 =?utf-8?B?amZCK05TeURvbEJ5RXd4S2ROMWdpS3R0cUZ6YWgwaktKWUszUXNjbVNxOXg4?=
 =?utf-8?B?bjBXNjVoSUdxVnpxS0hmTTVHV0gvZTNhcHZPSmNGWS9iQmgzcmpRaFdRZXc4?=
 =?utf-8?B?QVlWU2dxdEUwTlhXbU04WUZpL0FmME4weEJIczE2Z0ZsYm51ZVJTblJNK0Z6?=
 =?utf-8?B?VTBndGUxWGk1VU9JSmFOWFNiWjB5ejRzTzVMUlA3QTRMMXoxWTNCYkJySHVI?=
 =?utf-8?B?ZTVYdE4yV2UrbjZVT0ZoQ3lXalliQ3ZENVFrZ21VMDdaeC9zdTB6L2hidmdl?=
 =?utf-8?B?K0NSdkRKME44cTgvanNBeDRKeVN2YXRxQW9BMGpudjEvU3YxclFUTEVnNlA1?=
 =?utf-8?B?aFhTVUlTV0dCMVpRWEFaL0Ntd3MyZjV3SXo3citVN01LNFhMdGJHTWdvSzZU?=
 =?utf-8?B?c29obFRhNWRDRmhWc2dnaWttVWZzUmhQcm5ubFI4V1FpelZjeE1pSkhQa3Zo?=
 =?utf-8?B?MXNlWFBzSFpoM044ZFlKdEx3M2E2aFVScWFEa0hxNE9rbHJqZVRtQWkyWm82?=
 =?utf-8?B?NFkxU3dCcEVxbURWNEU0Wmt1WTh6RTdtSitwQmdDUG5HS3FRZC80OWl5dW1Z?=
 =?utf-8?B?Q29HdEdJMkQ5eTNTZXFnek4zSDhmRkRYNkxvUmtuQmcvQno1OU9udFNFWUJV?=
 =?utf-8?B?Sk4rajhodlNxaVhSd0Z0VHQ3QjNEMDhwM05XMTYrVThJckZSUHd3cDRSa0NH?=
 =?utf-8?B?UEh2bnU4UzdvdUZQdzU5UW5KZkZKUjRaRzFsZDJIMzhUZGtjeXdoZitPVEMv?=
 =?utf-8?B?SDJNT0s1VlcyL0NaZGQ5N1ZvZHVacGxMb0xNandweDlNa1pFb3drUjJuUkN4?=
 =?utf-8?B?bHpuVVNWZmU3SHJ1MmFVeHBXZysvSVNwelU5Nm5WVWsvK1BPZ0RjVkVRWHZ4?=
 =?utf-8?B?QW5GYXA2TEtXRmVhS2YwK2JSa1VQaVZWMStPejMvYm02RXBOM3VWV3BVTUd6?=
 =?utf-8?B?YllGejc2RENKZFp0L2pnZFFiM2hHeHpPaWtNTno4R0JhbnBhdW96M3loR2hp?=
 =?utf-8?B?alVsQ2hwQWNDdkY4a08xMXlLTUVKcExnK3RVenBOeFJOZVRHWHZ2QVhjTDUz?=
 =?utf-8?B?T2Vjbnp1L0FNRnIzM0VLc0NUelpuMFo1MEcvTDdCZk1rdE5DNGo4SVRkVU1O?=
 =?utf-8?B?d1NveWJDM05aZTBQZmFyNWxFaEJBL1ZxS1dOekJoOEVsT2dPc0E5S3dxdWRO?=
 =?utf-8?B?TUdJQWlkK1o5VzV0SG1ObHUyUTczSmtLZkFZdEdob2djZU0za3kzZFpMY0dQ?=
 =?utf-8?B?U2x2UE53Zkt6b2dlcWVXUFBSMGEySjRkdkNlYXMyY0FiT1d1bnNTYTFraUtJ?=
 =?utf-8?B?WEhabHVZVTZqak54VnQ4dTZTcEgybnQycjJqZ0dOK3Z4Y21WVU5vaHZ5czZj?=
 =?utf-8?B?RURvM3pOWW9ScVV2Mis0ei93NUVsSDRwNlFpSHIxV2lyZTBoWG81MlYzdk1B?=
 =?utf-8?B?QXAwbGo0ZTZaMTBwUG5sMHo3UHBhMEVHK05wb05xVUZZaUVseTB1WmJFaHRh?=
 =?utf-8?B?amxOUEFrT21zME42Tnh6K09PN2hNVzBwSTd2dXVHMEZxbkZCZmtoSWVWWStu?=
 =?utf-8?B?NWRMVmRHSHFNVlA0cW9NTGFEUGl4Qlk3dDFOWVVoOWxzTE5yeHVvUWxyZ2xI?=
 =?utf-8?Q?l38Gx4OtQIrZTGNfClssg6sXd5LLg2iWyXMoR?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 33af7b9e-a309-4196-8812-08de5e74e7f8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 13:55:33.5138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92JvB4Wu0isFdHTieoSgE1s/wnpPCZtYY/1pDlKJv2Jh1s6mCMKmSlrLWaT1JZTIVE71paDbM/nK3NhBtPv2TATYdI14MYO1hJj/oosCqGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8154
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 13:55:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8764

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/licenses.rst | 30 ++++++++++++------------------
>   1 file changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
> index 7d6636eef..1887e8e35 100644
> --- a/documentation/dev-manual/licenses.rst
> +++ b/documentation/dev-manual/licenses.rst
> @@ -112,8 +112,8 @@ commercial or other special licensing requirements. Such requirements
>   are defined on a recipe-by-recipe basis through the
>   :term:`LICENSE_FLAGS` variable
>   definition in the affected recipe. For instance, the
> -``poky/meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` recipe
> -contains the following statement::
> +``meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly`` recipe of
> +:term:`OpenEmbedded-Core (OE-Core)` contains the following statement::
>   
>      LICENSE_FLAGS = "commercial"
>   
> @@ -136,7 +136,8 @@ needs to have a matching entry in the global
>   :term:`LICENSE_FLAGS_ACCEPTED`
>   variable, which is a variable typically defined in your ``local.conf``
>   file. For example, to enable the
> -``poky/meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` package, you
> +``meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly`` package of
> +:term:`OpenEmbedded-Core (OE-Core)`, you
>   could add either the string "commercial_gst-plugins-ugly" or the more
>   general string "commercial" to :term:`LICENSE_FLAGS_ACCEPTED`. See the
>   ":ref:`dev-manual/licenses:license flag matching`" section for a full
> @@ -244,7 +245,7 @@ Other Variables Related to Commercial Licenses
>   
>   There are other helpful variables related to commercial license handling,
>   defined in the
> -``poky/meta/conf/distro/include/default-distrovars.inc`` file::
> +``meta/conf/distro/include/default-distrovars.inc`` file in :term:`OpenEmbedded-Core (OE-Core)`::
>   
>      COMMERCIAL_AUDIO_PLUGINS ?= ""
>      COMMERCIAL_VIDEO_PLUGINS ?= ""
> @@ -460,22 +461,15 @@ and the source code modifications in one step.
>   
>   If the deployment team has a :ref:`overview-manual/concepts:bsp layer`
>   and a distro layer, and those
> -those layers are used to patch, compile, package, or modify (in any way)
> +layers are used to patch, compile, package, or modify (in any way)
>   any open source software included in your released images, you might be
>   required to release those layers under section 3 of GPLv2 or section 1
>   of GPLv3. One way of doing that is with a clean checkout of the version
> -of the Yocto Project and layers used during your build. Here is an
> -example:
> +of the Yocto Project and layers used during your build. Removing the Git
> +objects can be done like so:
>   
> -.. code-block:: shell
> +.. code-block:: console
>   
> -   # We built using the dunfell branch of the poky repo
> -   $ git clone -b dunfell git://git.yoctoproject.org/poky
> -   $ cd poky
> -   # We built using the release_branch for our layers
> -   $ git clone -b release_branch git://git.mycompany.com/meta-my-bsp-layer
> -   $ git clone -b release_branch git://git.mycompany.com/meta-my-software-layer
> -   # clean up the .git repos
>      $ find . -name ".git" -type d -exec rm -rf {} \;
>   
>   One thing a development organization might want to consider for end-user
> @@ -494,9 +488,9 @@ automatically::
>   
>      BBLAYERS ?= " \
>        ##OEROOT##/meta \
> -     ##OEROOT##/meta-poky \
> -     ##OEROOT##/meta-yocto-bsp \
> -     ##OEROOT##/meta-mylayer \
> +     ##OEROOT##/../meta-poky \
> +     ##OEROOT##/../meta-yocto-bsp \

Aren't the two above supposed to be

../meta-yocto/meta-poky
../meta-yocto/meta-yocto-bsp

With this fixed:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

