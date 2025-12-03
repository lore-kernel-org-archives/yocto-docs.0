Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B3CD12D75
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 14:57:57 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17207.1764773875325746246
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 06:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=QS/Vs16J;
 spf=pass (domain: cherry.de, ip: 52.101.83.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVxEn1TRypT6lT//pAgGxYWeLIT6fR2zOVKkRZx+RNs6jv6dtDhjyOYZq6Y9n86dWdyTQ6C6jevbCYjqrMVpdiJ3u/vo/u+QRS1SkVKDU/o5G2LiVXjgR4pCO3CMqTNmThS2Lz0WxF/STzItALcUbk6v7etGeYF31ujeolCqlue7i7MjTDYatFqofGY2qPIYpHgi7fGKPq/tA/3z6iyLqr7gjbARLr+WuVswWz/cQmDuv1F3tVP/KpjEQ3w04SudmEaNxdwhlK8yyoKwljhFNhkj+FTMOqR/I4gHm9btuh+IO3V7OlYnBvitFzfMKi1VVhoUypNCHl2nev6g0H1KqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F68K4OWcUTI3BVSazui4e/Xaj663UNmHXbwBKQ8nNvM=;
 b=m34y/IkbebQoAfFh2Jc+h9IrFwjuhp+Yla+h+53RLtAamUwzb1DcW/6DDGZcgj4BG8fAVUZEpJfnhCT9F8KseXiOzCzFw9+QUfTY4vijrwNISD5h2UBd7KAiqjuISaFdDOvoEosIkIafVaUrFMbmxla+3ABd6XAsaM4exImPSZ46Ym/9+Hlt6gUxFcIgGiCrIqfbyayNV8OJjfwxijpB6XZBQRKn532NeTRECB3cs4/84EdC9bFGGu3mhauBYgs1Ruvn5aBGX7WmEG8mgJjiwOhBxLsng52jhZlMUQUEIEuYlZ7xmSdyprpWhR5wdSs9VI9DQsh6kf0QQDz9yF00FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F68K4OWcUTI3BVSazui4e/Xaj663UNmHXbwBKQ8nNvM=;
 b=QS/Vs16JV0tS1o8VVqv5IHPEi2nIpZ8p14zLoJqYoiflfe1mBtkzlnWqaOKd9feDJGj33qOTTswfHPxWVwQ1CRYDJAGjiHAo07P/a7hnnxbykf+OVU1VPUh62VABr/FJVC1Mx4MgyCiJ8ciAcq5w7RiVswGqUPojq4GvI+5Jr/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by VE1PR04MB7405.eurprd04.prod.outlook.com (2603:10a6:800:1a4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 14:57:47 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 14:57:47 +0000
Message-ID: <4bffea56-31b8-4a6f-b65a-337cdf10ed33@cherry.de>
Date: Wed, 3 Dec 2025 15:57:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/4] ref-manual/svg/releases.svg: mark whinlatter
 as current release
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
 <20251202-release-updates-v1-2-889513ccc384@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251202-release-updates-v1-2-889513ccc384@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::14) To DU4PR04MB12026.eurprd04.prod.outlook.com
 (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|VE1PR04MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa83bd2-af05-49d4-44ca-08de327c5255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V2R3WUt0MXpIc2FpdmFLM2RxQUJBenBORlJ6MUNpYTl2Mk5ZM290WTR6NlJN?=
 =?utf-8?B?OCtxNzIxVUJOdUJDcHZXSGhXZWZwOEJhRCtWaStnU2g4WW5TSEZLeThqcGwz?=
 =?utf-8?B?NmxPNEc0RWNkMi9tNUF2VmVyT284dGhieUpmMVZPNnc2bUIrQ2VjYXl1QWlw?=
 =?utf-8?B?cU9jVkRaa1pRT2ZnL0NlU1dpZnNXUzkwTEd1dkR2Q1ZhcDMwTGdxSE9ReFNW?=
 =?utf-8?B?cXJ3RlNHTVVKU0plRldMaC9SQjBoY1VxZzBhczhwVWUyQ1I5TnNrRWU5YVI4?=
 =?utf-8?B?QXptaFdQUkJhQmlUR1N2cEhoSTFVb3ZHZW9tYTBEWS9jdk93TmNUeEtkVng4?=
 =?utf-8?B?QVpwTU4yaGZpTlpkSHNrQk9tTmxEMXZnS1dYMFFTakYwekF5UzVZSDZHVEJN?=
 =?utf-8?B?T1gxUy93ekJKN3EvbmRtUGxTTjVhZkoxZW1MeXFJQW5adXZhNDdBNXYyc0VJ?=
 =?utf-8?B?RVlaU0plK2tQb2E0SDlwMTVReW14QTl3NGRNZzYzVmttckl2TXg0RXBsM2sz?=
 =?utf-8?B?MDdId0V0cmNZT0dmUXBkbmpJSEJ5dDd3ZXJZcVFOUkdvMU0xeEtsTDd3UWZI?=
 =?utf-8?B?VnRoZ3NxZEdxelo3WXlhdnBEekgxd3RwNUlEbzNrUThNUXk4Yldnb2o4UTM1?=
 =?utf-8?B?NThmNENYNjdaR3VHUC9MNUYyTXlDRE9JNXgxdWRRT0Z6LzJQWnkwcmg5Qkpn?=
 =?utf-8?B?aXVlSTE5SlNHMFZjVFFkVUhISVJMdnhUenJGWjJWK2twZVRiOXQ0WTdocTNl?=
 =?utf-8?B?cllYY3VxZERONGJLUFRvU2oyaGFlcDd0TWhRTVFHaGNMWFF6bmQ1dFM0cHMw?=
 =?utf-8?B?Y283VWJUSEVNRkUzTUNRVkVaaXM4QkxyNEdDZEQ1Vm5nUnp6QWcrZC83dHlF?=
 =?utf-8?B?OXEyeHA1TFVCRFJHa3dDZEg2OTJZdmR1NHdRUjdXRlEzbUtDUVA1WkMzR01p?=
 =?utf-8?B?U1pmRE1OWVBnSnlQMUFnNDRxRjZpSDJCUzJqV29lZnFxU1BOWmNoSmFTUHU4?=
 =?utf-8?B?czdNTDJNMXlBMmswcDJHTCtkb3l5RHZxWTJDSDhqL1M2VEdqckM5UDkrVTVv?=
 =?utf-8?B?NmFtV3c3OG5QRDRVTWZwcmZBWHpJUG9UVmo1ZzdjOGtRM1FWSDlNejEzSWFW?=
 =?utf-8?B?c21xZWZIYjNFbVBRSlRzR2hYSUpxa2tEMVdlRSs5dHZHTW5ObzBEYmQzeUtH?=
 =?utf-8?B?eGlOME1qemNPY1dpRmc2ZXFWRmtMa1BDZjFMVlJBZUFoWlJidDRxQW15S2dx?=
 =?utf-8?B?TE44UjhnUk10dVhKN015WkFVYmhMQ2QwTDVEOHc4emJISFVVZElPbXBhTFhK?=
 =?utf-8?B?TXl3VFdjVE5HOXQxTXVqdHpOZWJqd2xOY1hOUTMxQkpSY3NyZG1qb1UvTHBZ?=
 =?utf-8?B?MExMUnd2KzYrOFYwamhtdmowbjVaZGNWbW5NTW1OdWRxcERWVmxSZXNOT3dy?=
 =?utf-8?B?ZnpoVEdOWkFGMmcwRTErRnoxR3JVWHpZYlBaQ1hYTSs1VUNDeWtZaldVanBD?=
 =?utf-8?B?L2dPOW5OTitVbG9ENWgvMXJDc0o5TnpxVW9hTUt4c0hRQ2N2UEVtZUJiNWNt?=
 =?utf-8?B?dm1YRm5WTmh5c2lUMk53OE4yN0kraWNGdWpYYmk1RlVhOGZ3K2xRS095eUdh?=
 =?utf-8?B?WmV0K3NDVGJMZnJFSXI5SWY5MnJPcjVoNHpncXNXUi8vOHMrYWx6K0c5Wm9v?=
 =?utf-8?B?elVydUZrSjMwY0VoNTkxcVowWmRvN1J0MXlsQXhxTkkxVDJvUkNqVWx3YXFk?=
 =?utf-8?B?THgxSytONFVJbHdIZFFIbU8xcG5UUURwUjV6VHRjQ0U5OWhCa2oxNnBMNDF1?=
 =?utf-8?B?ZzRKNWthSk15M0duWGNrcmJMd2lycXZaMmpNVEN1T0FSbm1DMHFPL2ptVzdy?=
 =?utf-8?B?Z3lsWDUwT2ZGTzdjZ1pZY3hlZE9hNWUvTzQ3VUxoVU8yUDcyNG10NDZ0MFo1?=
 =?utf-8?Q?Yc6Q5xsRXwhVzMazp6OJo3C8SiTH3MvG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB12026.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bzhxbU0vUlk3NzVOWXY0eWR2YldkZU9sWmJHenA3SE44OUI2dlYrUlFoYWIw?=
 =?utf-8?B?UXhSMWNOSndycEhnb3B3dnNJT3JCNnRYWkVONlNPSWp2d2hzdlF4SDM2cDJk?=
 =?utf-8?B?WndwL08veGtaNjdMaCtpM01CT3k5Q1JFZWdmOUV2c0RqYjZ3ZXU2ZzhuU3h4?=
 =?utf-8?B?RmJlcGluNWtsT1ZVWkViZ0ZqVjJsMWFXMXBFV3dsdjFwZXVhNnovV2ZYUFNH?=
 =?utf-8?B?L0Y1eVZWVVFhdkVrcTNVaTlHdi8va0RpME1KMFMrR1o1VHlNRENESml0ZUNX?=
 =?utf-8?B?Z2JZNVQyVWVyZHJnQ0h3Z0ZvOFNIQ1lSa1IvbkJDRkU1ME9WelVHcjk5T1N5?=
 =?utf-8?B?d3Y1aVdhUVBjaGY2aUczZ1ZBUyt5UDZHWXNVa0xHVHJQRzJJdUZ0VUptL1hs?=
 =?utf-8?B?QWZudW5FLzl4WVRQMlVHUWs5RTRDdlRMQnlLUCsvSytMUGlUNlZBd2N0UHF2?=
 =?utf-8?B?dEx2NnlaTzZzVXNzeWNMUjhxVWFEZnZIdG5rbEl0SFFsS0pla2ZsVThyazBs?=
 =?utf-8?B?Y1ZhR3hqZTJaeXo2WnBpQ0NaWVZuWU1MeVJ3aWZ3TUpmZko0dG5yZXNmOURn?=
 =?utf-8?B?dytzQi95OGpoZlZ2eXNTMFJhcHp5amg1S2RnOUU1NVVJcDJRUXpXVEhlYlQy?=
 =?utf-8?B?akhRUUdqWDQ0VHJmVW5zRGczQllGM0NzWmtOZnp3cXdHVEJCcGRpZzdHd2Fo?=
 =?utf-8?B?R1duQ0F5elJjc0lJZUt6S3M4NzZYbmMzRno1RUdsT1F2cmNleUpHM2hjSW5N?=
 =?utf-8?B?enM3cjNycmoyTmxRM0p4a1VMcU8vODBjb3E0TER3M1lEWUZUMVJXdnEvVlpE?=
 =?utf-8?B?eUhwSUkzV2QrRE5PMWt5R21xc21vTTVyNFQvcTBiVWxuZFRpNVZ3eDR0U2JV?=
 =?utf-8?B?bVE0Y1FkSUhpNm80VW9yaGwwd2xYNXZ1K3dGeWdUNmU1dVhZdEw2cmErZ3Zt?=
 =?utf-8?B?S0IybW5EcjdXcDIxNVJ6VzM4TGpxdTVIajJwT0xyOUxrUkFYWGhCOHdCOUdt?=
 =?utf-8?B?YWFtMGFRY2FkUEN3RFl1T0g1TXBaVDJOZVV4ZFlKMjR3M2hxWTRSUUc5ZWlJ?=
 =?utf-8?B?azV2UUR6Q2pVdGxXZlNzOG9RRWtpMWhWS2NRQnNsL2JreFY5L3BiczVwT2xm?=
 =?utf-8?B?RXVNc2d3bWRraFBIWllhajk0QXZFTUwxRTBZQWpxQXo0cXpISldHdHZMemZr?=
 =?utf-8?B?Y0hMbldnNDlNYlZnZTFFT2VWWW1mbkY1RnljVnh4VE14L0RDekhhZWFuUWp2?=
 =?utf-8?B?cURNTDZlVDF0T3lPNmZYL25nUlh0YkJJWGpxYVl0VW44RCs4YUpuYWx5eDBx?=
 =?utf-8?B?WkVFZlFNNFFBTWovOXBYZFFjU3NDZkNrdjkrWUhYaDBubTI0MGNWV2wzZWUz?=
 =?utf-8?B?MWVENXVZclg0SHFOOHEzbWlabldBSnBWT292bTN4cDR5R2RIejlpNEUxY3BH?=
 =?utf-8?B?K3l5NytnSVIreFZoRzdMaFdCN1RwZ2ZrNUkwaFRQQ0RHV1k1Yk5KWVVtd0Vt?=
 =?utf-8?B?KzExTVhOZTNCa3RFdXEveDM5bzJIbnlpaUVaVEo0SWFNK05tQ0R5cHprSTBQ?=
 =?utf-8?B?T3RWZngwaVdnQnRYSStORk8rNVh2dTVyN3Q2NEZYb2dPV2xWeTFIT2xIMXNn?=
 =?utf-8?B?N2lYdmprQjM5T3NVNFpLc3Z6RlhKWlN0M2tvK3A2T2ZOTDdEVG9iVTFiVDgy?=
 =?utf-8?B?aWRJQjlrNThDbVJ5NWhEeFNZZ3krTU90eER0WnduY3BiaWFtclF6cHdQWTF1?=
 =?utf-8?B?cXpoYkdocCtJcXNkZkRJdG1xcmdFd0xkU0NJYTY0OXM2N045b0t0Q0NCSFdy?=
 =?utf-8?B?YldYNDIyWUpYdGxQKzEyTVIrbndzak9aWDJSTE5pVERIdFB3RTc2VG9yL2U5?=
 =?utf-8?B?VjY3bXQ1OUhhMEU2R3J6S2tYY1ZhMndWSkhZSzRvdlhxSmRxTzlJYWV3Z1o0?=
 =?utf-8?B?cnZBSUxBY1pJa3ZhRlppU0EwVTZ4N2ZEL0RVVVAyMXZnZmVlYWM2SEtKT2Yz?=
 =?utf-8?B?N0NoZHpsMERKWUlhRmY3bjB3dUJsKzU3dnNnSnF6eUYxQ3l5cDhPWWtnZXk5?=
 =?utf-8?B?N3BQbEhPczVUMVV3bDN0Ym9uelRkbzdoSW11dHFSQ1A3RW9jczBMV3lId1V2?=
 =?utf-8?B?RG4xejV5R0tOeFdjY2NOYVk3dmlBQ01lMFY5cngvNnJUUUhxRmJtV05XY1lY?=
 =?utf-8?Q?x33AoZr9c/iekCW0g9DlTec=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa83bd2-af05-49d4-44ca-08de327c5255
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:57:47.3121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3l8ZgEK6ta8Z/LrPiqM+nGEeGRDNeSsAivCHDfuQJl/MPwxEEXOPQGx7Y27dJG/qfQX61K1yFW1qASgj1qIZLkrDKO5izCdT2Zrt9tD0ww4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7405
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Dec 2025 14:57:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8196

Hi Antonin,

On 12/2/25 5:14 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Whinlatter is the new current Yocto Project release, mark it as an
> active one.
> 

Still in the final stages though, but I guess we want that in so it's 
up-to-date for the Whinlatter doc release?

Whinlatter will be released a bit later this month I guess, so we should 
probably move its rectangle to the right to align with December.

Cheers,
Quentin

