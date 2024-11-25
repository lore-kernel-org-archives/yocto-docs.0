Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E984ED58D78
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 18:12:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.78])
 by mx.groups.io with SMTP id smtpd.web11.25678.1732558364920902254
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 10:12:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=gg9wNsbp;
 spf=pass (domain: cherry.de, ip: 40.107.21.78, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOM+mmg9yRV4PCX1lfMUCDCpeRTqg3DttD328JB1miZbw3VpWSRaOg/M6uLWfgZel73l1f65NS0JFD8eI2fnI6jYDmEA5KTUnPHwDdYuvyA40vw3uYap0QQkVByOEey5yJPboEBOo2EaypN1+33qMRpmtoJ+LBNaxT4k2+bSGWO+3O5ug4VNptXmFhL1oz0E6EYnQr80gomflIxa3jlDcW+bjI6isLSQiB9JoBiQs9jhQBKJvHgUDzhVnGvib/j5wLUOwKWR7Gto4eKjPsjyQ5e62QmczdiAuytrtllR+WfGk0cIfygPZHzM4Wnn2zf44x/PquW7iZrnjI4lcl0V3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIonqkTZSNQJST6y6KwNjLhjwiGTqJWAalhn0zjRAhU=;
 b=PfsVI33aYkUX0jp1+e7ccAWfBNmn5bxR9ZE5ZddiifIJ4j1mzHGifSrniX4mzoVBO4rBxbMlZSFW61sDcuilDKBeKMbA4+oHUribWhVuneRcK3RctMo7kGkZBcaICOxGBkr2x3zbKcrTppUzBoxVKyt6Vl3dL4inYfEtWLqAntAu21Qbn4RY8mG6Dncp1XwjvYbNlyIsnCdQtfN8wCWjNL/bRHWuzgTcOYZxf9gIy0NIq7N83ID0rQs56L0AIwE5dC2Vqo/BhdaEtV7G0tvDjeWRnrzt5VFFCxp/sX3br3t9KMObHj3vSLErAF0YbB+e29tCqgva8VEp4uf2j/zsog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIonqkTZSNQJST6y6KwNjLhjwiGTqJWAalhn0zjRAhU=;
 b=gg9wNsbpsOiJ5QdKgTgxo9g3nwUNlc38aW8WHEwgxO7njoYq1SNpefMnojRbVP62vpM5liAEGpoE3fOPdKr/Z04l/FPzo44SMt+gJ6Uu6T9Jkw0KX4/FCLChadQKfYRcFIfPI/HPQSw3crh2iYhm7oULT1yBMSa+0R+oxXoOct8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB6941.eurprd04.prod.outlook.com (2603:10a6:803:12e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 18:12:41 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 18:12:41 +0000
Message-ID: <23c7eedc-7085-4f83-8786-82b0ff193fa2@cherry.de>
Date: Mon, 25 Nov 2024 19:12:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 5/5] poky.yaml.in: add missing locales
 dependency
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
 <20241120-update-doc-deps-v1-5-50e267ae4123@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241120-update-doc-deps-v1-5-50e267ae4123@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1d021a-5f32-4e5d-a23e-08dd0d7cc071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YkZqQk5KUWtUZk8yc1pEVVZyeHduUVgvUUxzVXFUNWx4YTRaeWZPRWQwZmJi?=
 =?utf-8?B?T25XTHlVTU9iTzRzTko1WDdKTGpEVkhSbXYwRkk1WURoNGY4ZlZUTDZVdVlJ?=
 =?utf-8?B?Q1Ztc2RackxsVmtSV0pNOFVyckt4QTgzTExBdHd6VCtGZEJuZ2V3cHFtLy8v?=
 =?utf-8?B?b284VGE1b1ZMbXVaTVZzeFZXcWtmSFdvNENaL05KenlFY2ZYaEFLc2ZGMEMy?=
 =?utf-8?B?akRQeisrV1E0emJTSVlaL0JCWTdSSmFFSjdxZUdUZWM0U0IvbUJoc3JFZkYv?=
 =?utf-8?B?bzhmYVQvR0ZBa3QvYnFQTzZUZTBZbnBuY3ZsamJ4eWNzWVZqYU5iUzYrUU04?=
 =?utf-8?B?Q3o4ZS83UCt2MGs2Yjc4RU5Kb3NCekVmSGpJODBydFlla0N1S2NJc1Z3NGNq?=
 =?utf-8?B?bzNvbDlTL2h4OE01WWZpdDBhTHN1Qy9SelNxQ2tvS0YrYkd3U2txYlhPOWpN?=
 =?utf-8?B?S096cGNob1oydUFmaHFoUHVXdHRCS1J5bVdlYmdYcGF4VGpWaldsQjZMYkRk?=
 =?utf-8?B?dU50LzNIUDFJaTRwem9waWlPRUZkcnlKQ1ZoUjZsVjhnZUFSQW9mcXYwV0Jh?=
 =?utf-8?B?RktoajhIcXZJVWpjOUE2eUhsRVhjSzNkSTFxbm5qbm9kY2hpWUVHdFRxWkZ5?=
 =?utf-8?B?WnViRVRsTHNWejN4ZmJBM3JlYzVQTUs5b3NsdVRwcHl1YU9ST2FkZkV5a0Vi?=
 =?utf-8?B?TFhQWEtDRWhuQndqUXNiVng1Qm52TGZBZ1hqRHhwU3JkNGF4cVRTYUxtOGl0?=
 =?utf-8?B?VVdKTC93dUhzWHdMc2N2ZGdWcVh5ZDVFTDFnUnpGWW8rNHdHaVJrbUNranpq?=
 =?utf-8?B?ZDJ2VnlGQ2ZBMStuV0VHT1dPWUJKa1pLaVE0NEJhTFpBZzVjZUw5eFZ5YjhV?=
 =?utf-8?B?czFCYUlBR3B4WUcvYlZ1SlhYZS92NTBEUEFPQXl5WVBYT2ljOG9tQW1sNW9h?=
 =?utf-8?B?eWRkVU9WK2FuR0V2aG4xU2czbUdzTVhaam1WcUNRc1VLYmxGUnc2R1hDZjR6?=
 =?utf-8?B?dTNPUTBZOGE0UzlkM3ljd2VlalFqcWhiRzQrbjF1Y1hkUWxkdXVnS3ZaRHhL?=
 =?utf-8?B?WmR0YjVJWWZYU0k0U1REUXNFRTBuTDRsem14M29GWThyS0tzOWptTDFlakhS?=
 =?utf-8?B?b0owTlY5VDVIWFdqSnNUVHd2THN4bE8yS0F4T0w3NzlGUVhlMzVHSTlSTCtW?=
 =?utf-8?B?U3VWL3IvTWRuY09GK3A3a2pBSzd3bzgreitDUHpjU05EWDd2bkNwa05tenow?=
 =?utf-8?B?bjlVUk9uajhzTExnNDZBb2U0OUFwTExPSXpMR0VxMU1TaDI2UEtueTdSUHF6?=
 =?utf-8?B?MDkvUXQwMDlyVEQwbDhIRkJrdlNSRkVseWszN3RCTys4U1g2UGx6NUN1UDZy?=
 =?utf-8?B?M0F0emhSV1FaeDhJNGk3K3JPUVlJQjV6MXUwTDVEYlNUWEl0cjBRN204Y1Z0?=
 =?utf-8?B?VlhXNHM1YklzMytVOGV2TGhyckZQbnM3SG1JUWFuRUczK1JSc3dnOGxLVHhD?=
 =?utf-8?B?c3B0L0tYenRudXBzUVpFNWhrMEhTMkNXeERLL1VMYzRhakRqeDZjRmV1aVJz?=
 =?utf-8?B?OGNiQ3l1bXVkNWhKOCt3VEJFWmRxOE0yK0JpVEF4MlBhdDE2c21BOFVuSG5t?=
 =?utf-8?B?SDgyb28wOXJlelR0cWd2c3Q0RVRqYldNWTRMRlh5VmV5Y1NaRmJuVXZiYW9V?=
 =?utf-8?B?QVRHN2NFQ1dwWTFhS1NDamdWMWx4SGx3aDl1TkU3cy9RcnpMcU13eGRscUdJ?=
 =?utf-8?B?elpMZ3ZRSUVPN0dzTHNRRlBaSXFLbzZtRFhURXIvcUtNcHYxWS9hR0l5VjM3?=
 =?utf-8?B?eEh0UXRaek55VDRvRWVydz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QU1mVjgrOE5GcjF5OTNMTzcrQ2xtR1h5TDV1VDZyWm5ueTJtUGI4My9vaTRo?=
 =?utf-8?B?MGNycE9zb3NpV1IvZFEreUJxY2gxMld3OTVNVHNHTkxSUzZGdXgybExvQ3BK?=
 =?utf-8?B?WjJPeTZOOGEyYzlzMFBmaWlqWjRFZllZRzBVNlVlN0lTZTh1bWc3YUcyTGx2?=
 =?utf-8?B?RUlBWS9ldGdWZktFV3JGa29BdTdSd1JrNmR1K3IrWjQ4aVRhQUlNMlNJb2RV?=
 =?utf-8?B?Y3JYWjlDeFoxWDZWc3ZjaDZLRlFJZS9qMVhZaUw2VzlyRzhiU0I3VElTZ245?=
 =?utf-8?B?VkswU0NmU0I1S21sVzhFYjlLNndKTk5nUERZR1RUdGZhYVV1UDNENXZSNm9r?=
 =?utf-8?B?K2EvUjA0dEt0MU9scmpFV291YmZwZko4TUhRS09IelpOQVRxTUVzTEN1WGp3?=
 =?utf-8?B?WWNRcUNTL1FhaVRic3FDQVA0R21FbytTZU9IeGprTGNJK1JCUlh2N3hYeWZy?=
 =?utf-8?B?WUJCRnBuU0E1SVhPZE1CejZCeENmZWRaeU12ajZURk91dVlIeG9KODFvVWJV?=
 =?utf-8?B?MVMyazlrM3ZvRWt0cnIvTWgxRCtwR09sSWJhUjZyTVVaL2c4dTBwcDZ1QWFL?=
 =?utf-8?B?S3RUVUppd2FwTTAvanFCYkw1NEpHQWpveWN1WmswYWQ5NUlpY05kZ3lUdzhE?=
 =?utf-8?B?eHhmNkxIbWxCNGFabklvY2JTaGF0WFAzdW8xaThGdnVPaHVaRFk1SDRXeFRs?=
 =?utf-8?B?bGhWS0VVUDE2a0Q5UDlkcXVqL0FSZWJEQW9QWlpiNm1yNGFYVm1CSEpTZjk1?=
 =?utf-8?B?cEhINGt4ZUEweUdXRnpGTllOamM0Wm1QeE5YZm1MbFMzVERGM1RKWEpTdUkx?=
 =?utf-8?B?dFJqQkFkc1Rob2o3L2FpVm5hN0dTYXNaOHdiOHJ2ZHkvbHI0SWRCaTZId0lU?=
 =?utf-8?B?RHNCRnlXb24yajY5Y05aeC9ULzY0bkE4ZE5yMnk0RDVMYXE4aVhZaVlWTzdz?=
 =?utf-8?B?aU5vUDJDZGpKdGxiNFNnamNCTFdLeGNmVVNaRk9YZHJpV0JIRWRGL2xWZ1V2?=
 =?utf-8?B?OVlwWlNVQzNDVVJGR2dLaTU4OC80RjdqdmcxL2FZRk4wcjVDd2owWW5DSE1z?=
 =?utf-8?B?QzJJL1AwYmRWSjRYT0pSOFZvSUhvZkhVT282NE0rdW52OGRXT3pHRVFYREho?=
 =?utf-8?B?UzNLdXdLTDE5dlpIK3JrN0FzSlJwVDVhcEg4OUIxVm1DOGtuK3dLSkNtcjBH?=
 =?utf-8?B?cXlWS2hQMjE0ZE92ZFI1RGRPVTQ4Z2dDN2NaSXdna01heU51aEtQbUkwWGd1?=
 =?utf-8?B?RENOaE1zUjBzL2Z1SndyWFVuU0RJcUVoT3lxN0pIMzlNMGhoM1NuVGZ5bkV5?=
 =?utf-8?B?WnRCbmIzY3o5ZE5WbVdzV1RkVXc3OXlWUzlnSDBoY083S2hWSzFqRkQ4bERU?=
 =?utf-8?B?SW82WTRqa0tGZGhjRWZuYlNZRVVDc003MFhjaDZnWStkN1ZpUlBmYldUTWdE?=
 =?utf-8?B?cGFOelVvWFNPak1UYmlsVkNIWVFjeFVxNlhsUW96cXNBN3RyeE16ZDJhNFFD?=
 =?utf-8?B?Zmo0S2VOSHVObE5weEZtSlVzRUcxWEU0OExBR2tEQUlZdS9SR0NONTdxeXJs?=
 =?utf-8?B?d1NINEhrRXA4RGpBSGtNQkJxOUQ4YUxJS1VvOVRCVnZKeHB4d3ViSGxkY29J?=
 =?utf-8?B?RjVSTzg2Rkl3K2t2SjNtWXF2a1ZFUzFxTW0vZ1lmWEprSTJIYU1MOXh4ZWFC?=
 =?utf-8?B?QnRXYXRzTkFmc1VkcWY0TEEvTmpzSkY0bjZJejZWY1RBSHRGa2hDZXN1SSs2?=
 =?utf-8?B?MGI4R0c3a2JQQUR4WEJPeVl0RDNnY1FKTWNqOCsrcnlyZ2s1ZS8vWHNwWlZm?=
 =?utf-8?B?YlpXUGE0bFkxR1dyYmhrT2crckwrWThGc0wvNGxlSTBDZG82TWJ3YWFCZW1t?=
 =?utf-8?B?bVNmNytVcmxxdWRQQlR1UCtkYUliM0d3QzY4TEZHWi91Tk0zZm16VDRMaVU2?=
 =?utf-8?B?NlB5SE1jRXpvVWZrdkNZSFREMmZuc3g0RDdEeU9EUm9JYmVqSGFXN0NiUFRw?=
 =?utf-8?B?Z2h2OUp0ZHNYbkFmWWpUa1RoS3MwbXFKZEl4NWNTb2p4a09QVTdYV0g0VlR3?=
 =?utf-8?B?YW9LVGNIKzIrb0kzNkxUaGdTQys5VTJKVGZwZWQzWjB5cXkxZFNVRVN2QkVY?=
 =?utf-8?B?WlQzbWdSa2drbVM2RUNtU3FZK0w2a3NIaGF2RzRGajBsY0VvN0V3U0ZwWXQz?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1d021a-5f32-4e5d-a23e-08dd0d7cc071
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 18:12:41.3366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Cg7CQplHGuDHlMFoRUgekvdpO/6t4nbdA9CnGYiq4MPwX57veVGPak1p+qlEGN2MTblVqw82XKhjyl97FrCxLDbTOxp+146qT+WD7IugaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6941
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 18:12:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5808

Hi Antonin,

On 11/20/24 4:10 PM, Antonin Godard via lists.yoctoproject.org wrote:
> This is a requirement for building the documentation, otherwise we get
> (on Ubuntu 24.04):
> 
>      File "/usr/lib/python3.12/locale.py", line 615, in setlocale
>        return _setlocale(category, locale)
>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    locale.Error: unsupported locale setting
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/poky.yaml.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index d95b73c74ad7979609c6e7f4e1be5343968da743..0158203da7d4db9eadf21943d10256c6bc49a290 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -63,6 +63,7 @@ UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL: >-
>   UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
>     git
>     librsvg2-bin
> +  locales
>     make
>     python3-saneyaml
>     python3-sphinx-rtd-theme
> @@ -135,6 +136,7 @@ FEDORA_HOST_PACKAGES_DOC: >-
>     python3-saneyaml
>     python3-sphinx-rtd-theme
>     git
> +  glibc-locale-source
>     make
>     python3-pip
>     which
> @@ -203,6 +205,7 @@ OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL: GitPython
>   
>   OPENSUSE_HOST_PACKAGES_DOC: >-
>     git
> +  glibc-i18ndata
>     rsvg-convert
>     make
>     python3-pip
> @@ -286,6 +289,7 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL_CMDS: |-
>   
>   ALMALINUX_HOST_PACKAGES_DOC: >-
>     git
> +  olibc-locale-source

I believe this is a typo here and should read glibc-locale-source?

Cheers,
Quentin

