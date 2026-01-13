Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2767ED0C85B
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 11:33:12 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56754.1768303982979963128
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 03:33:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZFNfNLEU;
 spf=pass (domain: cherry.de, ip: 40.107.159.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHuvWggM2xqskcBA1WxczCZMe9ZKyyFf/3h7S9MRoXj7UVIX7ZI3gw5OoUkqLGMrOjtE5tmsNyb8raRKjf343h/BBautInBgATZCKFVgAZQ4RtkkhxcVGB3SYEoiXFYi0s2aTz3ey2Dml5oVzfhGQD3bzHq76KWATYVs1N+9BZUmHYZ3SlFE8v09GoEEdXqDMdHYsERoYlXYEpjQCBw8RUEK9+8cqc59t4x/fYnT4a7Lg4l/CJhXiiH65U3kYbU4NVuSJqoChbEuxAT9H2ttzDLmM3DQaD1YQuRPUIvMaH3EVTATZc8IrY1kkyVWQYTMOYYe8p/NjhlfBuFx2Pbejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTtyct6Ozz9rDP77CbVuzd+IDInYzbVKu8cLy8KVnEs=;
 b=wPQsDa3x/FdY+0D1gkxKMHCxCCGtpQyZmb2UWgobqOZZ6ufVnkQi5HNc8gq+KEbqGdMiF3IOIcEmA2ocAitG6qhlSIiD4cZv6SIemeshFp5dQSpWivB0pIEbQdgfudCkW+GMtknQGWeieXPnkSXqDV8pdj9tS5JnAak+gQnV2AEa2MaG2csr1REt/c2SlZJwqGGGNkrGwa1TeyD+/bG2EmToMX0maYesy8wrcNk2HC4G3Jgg2gTFRW5w+uhzdhQoaoD5Y0nbi+z7E9VenphxjPXurE/0yucU/yHZeQfD+dTzOarPz9+db/Q7hfSVJkyI7HfsDuKB0uxXmJd/M6EilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTtyct6Ozz9rDP77CbVuzd+IDInYzbVKu8cLy8KVnEs=;
 b=ZFNfNLEUOOyhC4jEWcepByNJ6D24oiWDHYfuMNdJONRJT7UunkJNqizfA5PnfgTq/QW7N1KkcjaSLiyqr4razkzcZ+W+1AMfI6yx3UftXuYrG6otLS4ogx8kte00atWPT7p9ECX0zj61DYvokdnSz0mASnxR0jeAYoFvUsFS6Ys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA4PR04MB9391.eurprd04.prod.outlook.com (2603:10a6:102:2aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Tue, 13 Jan
 2026 11:32:58 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 11:32:58 +0000
Message-ID: <9c75bbdb-342a-41fe-a92e-d7f71e1afe76@cherry.de>
Date: Tue, 13 Jan 2026 12:32:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 08/53] dev-manual/debugging.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-8-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-8-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::11) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA4PR04MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5e2670-96e0-42cb-b088-08de52978083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NzFLWlVMSlBtNVFGZGhWUFF2UzF4Q1JwemloMi9XT083bWZnSEFLVXpKS3JP?=
 =?utf-8?B?K3lxb25DZGFhM0gzSjBQb1ZvMEt4T3BwNmdtcGkrSWJnNE5hZ0VuclR5OUg4?=
 =?utf-8?B?TjY2VEFLaHN6bU9jTmpxYWh5S0NhbGFNUXQ2akMvYXQ3WnNlWldVUi9VMll3?=
 =?utf-8?B?Z1ZCNWdiS083cVBIY3V4K29OLzV2Z0FiLzV4YXpSbzFvdzluVHZ5N0N3OGpR?=
 =?utf-8?B?bUVzLzNZS0hNV1UrZ2t0NGhyRnNjWFNpUnNCTW52VkNTdk8rYm9VbG1CSVh2?=
 =?utf-8?B?clpPZGlKdHo4a1c2aFMwMDkveFVmMXl3ZUZmNGxQWkJkUlU2T1Zpd3paV3h1?=
 =?utf-8?B?TDNFZWMxRmdrRFIrQk05TWE4eGRZdzhudm5KLzU3cXdERllzWWR3K1Uzd0Vn?=
 =?utf-8?B?NitxZTU4V05ROW1kYkpxU2VneG1UTUJlcytTMUpybm1SdjZRUm52NG1TcS82?=
 =?utf-8?B?dnhoQkk2MC9Va3FrUkdMVkFWc3MyYUk3b0FtZmdNY04zeTdoOHVlV280aU5y?=
 =?utf-8?B?Z1hPSEdWblFBSS96K01idklPSHB0MmY5ZnI1emVLdEZCYzlLS3JNeld4MkYy?=
 =?utf-8?B?djBlOXk0MGFrWUM1ZXRkNmtYOTRCTHY3Tjc5bzZFL0ZsdEhQRkp1S2V5NlFn?=
 =?utf-8?B?MWZsYzhqUW5CbUg1dWFWWE4zOUh6Y3UyV1l4SnhoNVFudGZXS0QwV0VlV2d0?=
 =?utf-8?B?M1NQRUZkNGEvWndha20xSnNURkpSUnBaOS9kQWxQSDAxd0lDTW9QZCtnMHMy?=
 =?utf-8?B?amNCTVIzd2ZqdCtBTmFpTThKRGZ6Q0Y5OTFqNit0N05HM1J6NnNERERDRGph?=
 =?utf-8?B?SEtKS3o1UUkxYUZZZUNEbGxSRlpqUXFZR2k1d2hZNEVYMEVSdjhVMHFZSGxp?=
 =?utf-8?B?TGcwQnhCc0xvTU56WDVxcjdHaGtNcm5jclRNYTJYeXRwNURvbmlRdkVxcUNi?=
 =?utf-8?B?dHdZaFdpMllYMXNVbDdlY0tmWEV5bU9QY2F5b2Zvb1JTUUNqRWFjcFUrd0tz?=
 =?utf-8?B?cWtBRXh6RE0zckpWUkJPSGpndkM3RzJUcjV1NEdMWWg1ZFdLTEJBM3Vsc0hW?=
 =?utf-8?B?VmhXV2NxS2xQZTFMOU9ieEdHT2d2Zlc3ZWJKbHhaN1dTQXlzamt0Tld5SVhr?=
 =?utf-8?B?YWVEU0pyNE8zOUE5WFNlbEZLVmN1T0pLcVFwZTgrOTFoMHdUUngyWWZVWStl?=
 =?utf-8?B?UElDVXEydjBCSjZ3bThkOFUyUmJjY09YemJFVG1MNFlsRWRTM3FteWhDVVZ1?=
 =?utf-8?B?dkt5NUNGUExuV1M3aUZzV3RzckFhZmJ3QlVNa25Ib3lQbEdxdlI3bHJnT1FE?=
 =?utf-8?B?MXNlUEJqQy9Ya2ZBUkNacXVzNGtSakR5bGE0b0Y5QTFDdlFaYldkZ0dtRFVi?=
 =?utf-8?B?SHpSUzBEenkyV1g3dkF3ZGwwRFJYaTQ3bjdNUXphT1NnTkN5UFVRcy9QbDZE?=
 =?utf-8?B?bkRRUDVWL1ZSeHIrTjhTVWhaY08zSUtrcDNjU1oyWEVaNSs0QXVUZ2dQbjhX?=
 =?utf-8?B?QnRpWFIzbnhPZDU4SWRrNXJVQTIydEJJSitGcGpWR2laZHNHdk1kbFg3OG0y?=
 =?utf-8?B?WmNxNDBQSUljZktRUkMwaDU4Tk40YUNVM1RJdU5maXk1L29tU3UwMWttSmo5?=
 =?utf-8?B?RDFqWVYzMHpza2hYRVlkOTBMUEltY3BQejNEK05JZEl3RkZHZTJpTzlSMjJ2?=
 =?utf-8?B?ZDNDc0ZYMFR6UU1mR2ZEaXV2K0kvNkRwaTNtQnBUS2NodXg1VnhBMERqVzZB?=
 =?utf-8?B?cnFRU2NZeVBoR1Jxd1FvbW93SVFMVlBoT3NvMjV6MFJ4eTR2MlJpalB3aGR2?=
 =?utf-8?B?UGppZEgvc2I1VGsya0tBZm0xdUJEcjFFa0dmcG9DNG9lRWFUUmNLeGhFRjNa?=
 =?utf-8?B?aS9uZGNSYXU0cjY5SWp1QlpsUW9USGFmNEFzM0t3eWNTMUwyaXV2VGtkSkI0?=
 =?utf-8?Q?lI7NuozeeApnKpwEItcBCN4ZGLdGHd9p?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bi9LSDdveXJmR0EzTWh4akxTT28yVy9IT3dlWnBTS0U3UFdxVzZhRTZGWEpz?=
 =?utf-8?B?VndCd2lDY0xHb3dJck5XWHQ4V3pDZHRhRnF1L2NiWjU0L0poYzRxQlZBVDJJ?=
 =?utf-8?B?WFNtcWd2ZFExek1VSXdoWFVURGE1MnUxNEp3THNZdGpDbnlXNkVuMHVBRjQ1?=
 =?utf-8?B?Tmw3MzV4eExHL2lsVGlyYndLTzIwaG9CZGMwVmFaSktTTW8rTFZHMy9OWjUx?=
 =?utf-8?B?V00vNThoM1NvOW1QaGJKSEIwT01rT1A4VmhIbE1ZYmpCUGRPNUpQcm5CaFZO?=
 =?utf-8?B?YzhjSXlZN3pzVUJtUmx2RlRJajBvS0xKRGNkZlBRS2NWOTVibUFlekczQ2xs?=
 =?utf-8?B?Sjl2ZWlnelFTV3JWcTg1eFRrTk5BaUhVaGhiTTBRL0dmUjBvbWJlSStRN2l4?=
 =?utf-8?B?NzlSbTdJa2VPMGY3czBLM0gxaWd1ZE5WWmFITEJDNG8xbGpyM2k3Z2dza01k?=
 =?utf-8?B?ZFNuQnBHMmhpWkxxU09BSjRyWWJlRVAyd3hBL0lCZHlDV3JSblp5clZENHMr?=
 =?utf-8?B?NGF6bjVOZ1dTM0V2b1ltNHoxQlNPY2U4ZnVGZkc4V0Jtc2JNYTJuQWRtUXJZ?=
 =?utf-8?B?STNwUVpUakc3VE56cmlLcG1kbzlTRjVtQzVpMmh4d3o1SkFmVlRoVGE4VXdJ?=
 =?utf-8?B?MSttOXJML0RLN2I4bDJ1ZU8rbXJ6c1UrekxhaUNSY3dGWjI2aFIzaWVzWTJI?=
 =?utf-8?B?OElNTHNJV2ZZUVdKYjdEQk9xTTM2VHNMYkRIcGNBVTlsSkVrUWdNZXNGM29u?=
 =?utf-8?B?Q3FoZ2QrNUhPWTBDbyt1RktZVm02bmpuT1hKSXZhYndTK3Znb21HV1FJc21M?=
 =?utf-8?B?WklKZXJSR0N4SFdpbHROM24xMmxOR25GNk9mYVMwWXUvaHl1TzkwR3Rtei9D?=
 =?utf-8?B?TFRnZkM2QjFUMnhMNFIrczZibHNSNXIrL3NMSU1jOS9rOWF6S1RuUzNhMFd5?=
 =?utf-8?B?RllLUm10UWlFZFRJdGNPMkhXL0dLVkZxS0pZS0lJN25jOXBVUTd2S3gyUXV2?=
 =?utf-8?B?OHZXRDFxaGJ3UkkzM3huNldkOSszbnhlclUxakg4V1FQNDBKNTB2VE1yMlpR?=
 =?utf-8?B?clN4SEVVb3RaeFpQd1hpSU5NWElYcm5yaTRjdk1GaCsweTBCdG1XN1VNdUlC?=
 =?utf-8?B?RUZHTXNxSElnYjFUOG00MXFaa2FNM05JMkpiUW5EVXAzSFhhUkVMYmk5YlBW?=
 =?utf-8?B?WVU4K0d3UjBSMzhMOG5lQk4zTUd3MlMxNnprMlRCS09kbzRXQWtaZ1E1K2VI?=
 =?utf-8?B?Rk9zTG11YW85N2JOdDd2ZDJqaTU4TkNMMnUvT0NyUEhNL3htTnkzVmQyU1hy?=
 =?utf-8?B?MG8rdy9LdmcyUGhMM3FMQW1XdFNmczgxdElJcGE1WVBtMjBQc0VXNEkyU2RX?=
 =?utf-8?B?UVJDTUwrNE4rTjlsYzZQM0ptcHlYbVI4Wmx2ZEJjV0ZvRzh4M2lSQTlWSmZI?=
 =?utf-8?B?aEhqVE9TZ2VKQ2U4OXY2b0VsaDgrdG5LZjk2bVJIUEgyWXBmYlNaM1ZZVWNC?=
 =?utf-8?B?Q0FIUjJGdzQvSzAvdlFmK0d5ZjBBZ2wzWmdsNkhZTmNpNS9WQUcvMGU5dGdx?=
 =?utf-8?B?Uzc2UXZ3ek42d3UwbWFrc3dWMGFzZ25YaEcrcnJWTFoyVU5nL3ovaXFJN0Fi?=
 =?utf-8?B?ek9pTWJBVjhBYVJoazZoY3pWNWF4UFI5cU93VlAxS3FxeGw2OFZVQmR0cnN5?=
 =?utf-8?B?d0V4aGpNMkZZUTFIK2ZMN3VBOCtpVEVkS01RQlV5QlZoblYydXFTV0ZqUzQ1?=
 =?utf-8?B?Z1FEQVRZYmQ0dlhuL2dwU042Ym9ndVdRU1djM244eS9zKzZSenNuTkI2dFhI?=
 =?utf-8?B?ZjEzSE1MZkx1cWtnOWd6MGxDcGVtTlZBY216SFdxTTRnZUR3OFdacVhPVCtz?=
 =?utf-8?B?WlRFak52K3ZNL1VKRzBCTVdSelJLWHNlczQvUEtkbjRLVzJtZ04xaHBKS1dv?=
 =?utf-8?B?NDc4QVRTWEsyZnF2NEdSR3JBSktpODJhazJtN3dKa2VhK2U1MUVBSFAyNmV3?=
 =?utf-8?B?T05XOVE5SjhRdUFTbVZSRW5vemJldlNqMU1KN1Ewa2loTnZ1MzhRMFdpa3Fl?=
 =?utf-8?B?TmdZdUtFcmpyWUdtQnRRQ1BIYzFBanppc1REQlBuNHl2cEI3amN2clI3NSs3?=
 =?utf-8?B?NDlZVDFWeW1FS1FxTWx2TlVkYitseFBjeGpNdXlPNy9LMmNERFlydFFERndL?=
 =?utf-8?B?dVJ5NVMxbjVRVGM0NHI2S21VdmU2UXhhVDJzcjhkUEtmVi81OGR5d0cydzRu?=
 =?utf-8?B?R3Blb3JFTkxOVldlQlR4eWwrcjVZZVZNWFNHTUo2MXVEbjRqUVRHUEdUazVO?=
 =?utf-8?B?STRvTkdrbndJMWNLaTFhR1J2NHNIcFFXM3BpazQzb0YwcHdaa0Qwdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5e2670-96e0-42cb-b088-08de52978083
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:32:58.4317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdMKZlIbLCYi/uEBmTthP7T4LiaGON7Ww+WgDlZgCFs7DMHeda2l7eqf8LI7dTHhprzwr0SnBD+ewLGxuqeSACgLa47+4X/0GC3IkPcyDf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9391
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 11:33:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8489

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

