Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F817C3600B
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 14:46:00 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.web10.24393.1743000351358900774
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 07:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Iv2MW6nP;
 spf=pass (domain: cherry.de, ip: 40.107.159.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ft2yALyTqBGZ0LUR09JXgi7ZkDE3mZ1b1ajlehTcTAH6hpZQw/LDUUoA4QCboSxEDG4ADxI4XQxU+lT4X6ShY983pDpncwUH8leGxinhGVbzZRKh+or6WN1OvXZp5w70ja+mtrn3vOBBIOhFmZWoPYInt6cwtHwSJHjUmdYXee/YCaXZZA5FCZr/DtleUeDN/lqUe2HMDBbnmfAdImXBdN03f4nB+zoF0IfzkmOfMxq7ZJ/ZnHpcuD9sbaEardZ8H/QoprpZSCEQU9OKOiU5Rab2FF8stFWuz7XIQcLg09EOxbefdlbkDAH9D+BEyCFTkkVjY+KkFVc1DMPloE93iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zj8sz2VR/gzAYB1jlpQtnkf3PzoFJTkZBPht5/82mxI=;
 b=GXQoJXbDCsVWT0qSP9aacQdSWcRdPX2pV4GCNyWMtQ3Tpdwi9luTRGqzLr+NS6VnKiK5U59qcuhyNivP5jHQF5MLAxrHXgSS4estVqozZm/Lstf5QhFMDJNX9zjvT1TXydKJuCewhwqFZte2bqC4KaNRfW1TeP48QlKogVloqbV0QFXS8Bi/H0rfxk3FoExsm++quCl0NwACRe8FwED1XQqN+IctFJZ2ODIyjdXbw2V1ZoUbgCunm6pSJxLCIxwhlsdHXYeCTn/YPvELsZXDbgyRglz+nrTN5nP54kBTQQ7i1dPjEeWngRcOkOWXiOIXhOU770WFx7IcKSXeODMMhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zj8sz2VR/gzAYB1jlpQtnkf3PzoFJTkZBPht5/82mxI=;
 b=Iv2MW6nP3zz/GpH0K/avbYsTZrbOXu6ya2jL0WEvnlHe1KQWjrXqGlP+FsNgynPPxliC9CKXDxV0CfRC6iHkShWljGyY9cHOuGYyn71H9lYomdDzq7ilyoQWGtjarzls4X1URAUZ4okLAsxKhOnt/nMjWLgsFoIJHrUwDWQzqp4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA1PR04MB10097.eurprd04.prod.outlook.com (2603:10a6:102:459::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 14:45:47 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 14:45:47 +0000
Message-ID: <952a4df4-bb51-4bc6-86c7-ad5268372dcb@cherry.de>
Date: Wed, 26 Mar 2025 15:45:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/6] documentation/conf.py: define a manpage url
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
 <20250326-cc-vars-v2-1-36b80c64c4a9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250326-cc-vars-v2-1-36b80c64c4a9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0257.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::20) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA1PR04MB10097:EE_
X-MS-Office365-Filtering-Correlation-Id: 378e5f6f-76f7-4149-ca21-08dd6c74e501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ODVTcDFOMmpLb3NPK3BwRk9xVHdENzIraGZsZmlwczNaeUtocGRKYnJjdmRr?=
 =?utf-8?B?MG11VzlISDQ3NFhBRHBnMmJBSEVBcGM5ckp5bndlVmowQTIxalFGSHhiRG93?=
 =?utf-8?B?Y01XV0NKRVduRnNhS21Eb1Zuak1PTGZMTUZhWHF3ZklLNzFWa1dMV2lwMlZT?=
 =?utf-8?B?eFJDcXlxVkg2MFNrRG43SVBRMkhqMUo3TjVZOFAvemtKSzBrZ0QvZ2ZKUExx?=
 =?utf-8?B?di9aanVZNjNRaHlZTnlGREM3cWY3cVhzS1BseDEwMVptWWFKTWRwc0d5M0FD?=
 =?utf-8?B?NnhIajZDUzczSE0wallYRUVnaFQxcms2aFY0K3drVzdRT3VuSm90OWNPcFRW?=
 =?utf-8?B?UFZ4ckdNWnF2UFpKRHVlV2lPMlBXUlh2QUd1QWRJVllZZlcvMU54cTJxczFB?=
 =?utf-8?B?djlIWFJwbWpqOHQ4QnFVYUF1Z0lmWUNQaVJwQTBnVHBMb0FDMjc1dldyYmlY?=
 =?utf-8?B?U2ttMEJSdTZONjYxODcxRXovOElXRWpGWW5CSlM2eGNHQXAyM2psNzYwdXpX?=
 =?utf-8?B?VzZ4cWhtZUdta1N2NmNoNkdWRUN4amUxWWZMWFdXTmNGdDViQzRoS2hHUVBS?=
 =?utf-8?B?YWp1R3BtZUpMZUJJTG1TaytHaDJuT29rUUJEWkpteVkya0RhSXMwRFpsckNk?=
 =?utf-8?B?YXlQN0QrazljRDFuRGNoVGVqUTk5QWJNZlh4V2xSamh4VFJWU0lZZzQyQ29r?=
 =?utf-8?B?azIvUE1nQ3h5UjN2eWp0OE5VbDYvSmtVRlhueHhtbEFlbHlsaEZrTEljNmI5?=
 =?utf-8?B?dUNBc3NjMExYTDY0a2xRVVdiYjZWTnVOVDlVZHdFTXk5c0JMUFNacU5VMU1L?=
 =?utf-8?B?VFhUSlV3clE0WFpZOWRZUXhWenp2WVVCaU9uNnBrSVB4VWlGMTNTcXlTV0N2?=
 =?utf-8?B?cFZKSnlXK1kvN2gwQVVDZnlNUGRuS2NmdEpjcVlNRzRrUEJQN0FaNDdoZ28x?=
 =?utf-8?B?emIyUzl0eUJ3dCtEd1B0eGxZV1ZQNW4rNVcrQlZkVFpSWVFVL1RnVHVvRGEr?=
 =?utf-8?B?QnNIOVlLZFEzWWxGc2JtTjJ5Vms3YTc5VzNPclB5ZVZIQUZSaEpudDRrcm9Z?=
 =?utf-8?B?TFE0V3B2Z01XN3NLUnY2UzR5NnVQY3pHUzZNblJONlk2azZ3M0g4Smo3RnJS?=
 =?utf-8?B?WURzNkpCNkdTaHYzU1IvTEZQWWdJdUYrR01uMVZ6TEl6bjJDbVQzZ1c3RU1l?=
 =?utf-8?B?V1BXVnJYUGRnWkNSQlBJajk3RFZRN0p5WXV2c3RScjdYNXFzM0hFOXJoTTJs?=
 =?utf-8?B?VURLZWZVeCsraDBWN0pWVjFCY1ppR3hpVFRQckNVZkFhbUZUS3B3bUpZeVV4?=
 =?utf-8?B?ZHNDMVdGMk1DT25VazczNVNRSUlpRjNFdjZXeEc2SnV1UlVUR3FHSk5LaDlt?=
 =?utf-8?B?bUdudXVZSkJrWXRoUE9QZkNIakQ1MktHQVRQUTRxTWFJM0RYWjhVMjFCWE93?=
 =?utf-8?B?bStkTjVOTFVFeXZjU2Q3RUxxN2NrNStKME5ZQW9qUkI3cklIVWkvdkRNNHY3?=
 =?utf-8?B?NmZQL3VUdG41RWVRcHpqRXVDVktpY1B4Y2VzakxZd1d1V2tQOUZzNXl6TWpi?=
 =?utf-8?B?NFF5RnlGZi9Hb2d2K0czQXpOUUg5QWpEVGNBbDdMc3QwZ1BVNUhYTE9QK0xI?=
 =?utf-8?B?TFI2R0g2ajVDOFc2NWtncDFIK1RidzFJblpsd3hiZzN2cEtEQSt5N0RpZG1D?=
 =?utf-8?B?UEYrUlBQVjBwSjlQY1NoRjRmcGFqam0yaUZXM3ZtTlY4ZnRkc2lFcVdBWExY?=
 =?utf-8?Q?8qPrJbyRA57vQ8oZFsRdxFTHQlDNvRMu8b1WLSp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TlMxM0h6MUlPYzQ0TTFQOFlGV3AzOTFLL0EvNjNuQkp0bC9TOHhXQW9PMWg4?=
 =?utf-8?B?cTBnSEJEOS9oOTBsSURNbkhtTXJXbU1QWWVieVhockVYNndKR3RJNHpYSTZw?=
 =?utf-8?B?Z3lLbTFNYkVVVnVRUU9kbmsvRFU3WDhPUERQUWlzbUdxQnNKcXl3aWFpQ0tj?=
 =?utf-8?B?dUN5SGtvMTBQSVhGbzd4MnBHUWw2NmZnV1VCQjRQSGRzOWlaMWxhbEIxVDla?=
 =?utf-8?B?TXlvdi85cGxrcmJacTNTN3ozMnFhdUNZblJFNjZ5NCtiWUNnb3Y0dEtYWW1q?=
 =?utf-8?B?VjBDdnEwblZCWXpYYjI2WTBMeEpIU29tVnQ2N3NsdW5ZeE50ZVNMTTI1NThV?=
 =?utf-8?B?K29naEZBWlFnNDZoaGNUbnRCN1V4Q1RiWjRGZmxKYnhBSlY5MGlNQ3ZqLzha?=
 =?utf-8?B?YVRCcDFGQ0pnUHpXSFJnYjVmMmU4VzBOYjNvemxDVEl0cjZSUFFJNWs4bnhx?=
 =?utf-8?B?S0VxdGVpNGEyWW9PN2dQbjB1bjJ1T2l4cTV3M3UrYzZvdnBHSnBsNVV4Qm1l?=
 =?utf-8?B?OE0vTDRKUFVNZ1lTbFJOZHhjQU52Z3RBSVJSZkUxVEM5QmNWWmNpVnBSNXJG?=
 =?utf-8?B?UDBiWUdPVTkyeVNiV1UyelVyeVBjN05qMStMWVhQMENpU2NWM1JrL1J2MUJS?=
 =?utf-8?B?R0VkcXp6dmJ1MUJzdWFmQ1F2YkZMemlWbHh1cTZpKy8vTkNaWEYySmdsYU5Y?=
 =?utf-8?B?YnlUR3lrdEdTT0ZBOHJnZkVGc0RnM0kvajZhbGl5Nmt6MXkxa2hPMy91VWtH?=
 =?utf-8?B?aXl4MzBPTUxNQXdTU3FxSEYwVmZBTTN4L2hWSjhBMVpGS2dnM1ZQTnJlRk1t?=
 =?utf-8?B?eTNyTTRVbmU5SndEdUJJSTU0bFlnOFBySzRRaXNOQzN1d04yeTNpUG52ckpx?=
 =?utf-8?B?SWxyTm5pQXZRUzlkaTNGczJZaUhEdms2cTdESEFtM3R1enZqKzZnK1dsU0U0?=
 =?utf-8?B?OFhhKzhMM0VIbG1vRElYUDd1eHFpQzRMWm5Edk9pU29FUHlpY2hzRE1XY2V1?=
 =?utf-8?B?ZGprU3pqZ1lDeEE0T2x2YitwUCtYMnUyQ3poUEdlVldNRDFBSnFzNjNUcHQy?=
 =?utf-8?B?K0l0SDA3MUQ2WmxGdHRhVUNocVRUbUpYL3g2RzhTUi9hcWpJek45bFZ5dDBJ?=
 =?utf-8?B?Ym9GdXEzdDM5MldhUFRDV0xKa0hNZWVZWGdsNVdrTzFnb214NWJPOCtZZXFy?=
 =?utf-8?B?L052cnBNQ1FrOU1sV3dsYkpFYyt1UEtRMW9NZ1dKWXVlNVlaY0Z1VHNkS3JB?=
 =?utf-8?B?VDBhdGdNOFZXS2RJMVppYUhmZVRxZ09yQWEyUUNkMHdpTUlWNnczdHFlNklQ?=
 =?utf-8?B?dWRQOTB4Q0NrOXQvcXkvTk1Lb2RKajhhY1Ywc1QxalZFeGhNdFNCWTlENWxm?=
 =?utf-8?B?WGtjZkovcEh0UHJ4QVpjVnFZYm13OFR2cHl1b1RPRDhWRFpMWkxTbkhsUjNt?=
 =?utf-8?B?bWtJZktmMlBiM2h0N2sxckxHYWdTRkQraVJJNmVTTmUweEtlQ0VpREJhN2Rw?=
 =?utf-8?B?bjRxL2lmM0VyMjR0eWN1T05ic3U5bTBXcWF5RmlveHBGQXJEZDR3L1JqR2lW?=
 =?utf-8?B?ZXpqbTEzVmNYMnh2NjFyaG4xL3hmMEJkQ0hBcFNTaWZqcys4NDdsL2VqUENv?=
 =?utf-8?B?RmE5UmdOOXNrR3RrT0dIa0NQNlFoeFo0c04xU1RoV1ZVYnE5anduZjd6VDJv?=
 =?utf-8?B?RlJQOEdFd01DNGRJOURxc2Y1cmowdXNQZzlwa2dQUEdmakdXSDYwRE5VeGRY?=
 =?utf-8?B?V0lONjF0OGdhZ2VNdEhab3hjbmNOTjFLTm5sR1Uwc1lBTHRXMG5nMkUyekZr?=
 =?utf-8?B?YUtqVXBNTkNYNTVKVit0MnV4QXh4ZHkwcVUzSHlhTzQ5N29DQUFEZTlvc0Zv?=
 =?utf-8?B?REd0YWlHbE84UEdLeERnUWlQZDhqbk1RbEpLYjVGRGU3Wk1SK2FYc0Q4Zkpj?=
 =?utf-8?B?YXVPYXBvZGdDbFBxZnlBTzREUmJKczB0a2F0blA0U01MUlN4VklhaW9kUmFB?=
 =?utf-8?B?dFlCaVJBODFLemhjb3FhY0VSVHBvRktVSmxaRncxN1M0b0VGYjJpNmxxWWZP?=
 =?utf-8?B?QmtnTHhYaFdhU0JVNmJCTXRxV1Z6OFR0QmhNUUN2MXV0Y0NGYkJmOEdwcGFs?=
 =?utf-8?B?c3RmMjVLSE1WbldRSmVuc0QwUVpmOVdDTktWRDB5NXljTU9JbzhmWFY2ZVdx?=
 =?utf-8?B?S2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 378e5f6f-76f7-4149-ca21-08dd6c74e501
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 14:45:47.1971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGQOXYcw2KShVCzIrnI/iA8GFi/dpDBPL9uahCGCv6jLT7e0S1L8/ORCQE9qgi7fBpCD/nEPWmZnNNqczDVt9MC2NmQ8Uqh+niNPk9otGqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10097
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 14:46:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6641

Hi Antonin,

On 3/26/25 2:21 PM, Antonin Godard via lists.yoctoproject.org wrote:
> By defining the manpages_url we can use the :manpage: role in the
> documentation for providing links to manpages. See:
> https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-manpages_url
> 
> Replace existing manpages links to use this role.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/conf.py                      | 3 +++
>   documentation/overview-manual/concepts.rst | 2 +-
>   documentation/overview-manual/yp-intro.rst | 2 +-
>   documentation/ref-manual/variables.rst     | 3 +--
>   4 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 477e75112a..0352bbef20 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -111,6 +111,9 @@ extlinks = {
>       'wikipedia': ('https://en.wikipedia.org/wiki/%25s', None),
>   }
>   
> +# To able to use :manpage:`<something>` in the docs.

+be

> +manpages_url = 'https://manpages.debian.org/{path}'
> +>   # Intersphinx config to use cross reference with BitBake user manual
>   intersphinx_mapping = {
>       'bitbake': ('https://docs.yoctoproject.org/bitbake/' + bitbake_version, None)
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index e4d806f98f..25cac82816 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -2204,7 +2204,7 @@ require root privileges, the fact that some earlier steps ran in a fake
>   root environment does not cause problems.
>   
>   The capability to run tasks in a fake root environment is known as
> -"`fakeroot <http://man.he.net/man1/fakeroot>`__", which is derived from
> +":manpage:`fakeroot`", which is derived from

Should we pass the section as well, to make sure it'll always point to 
the same page, regardless of other sections that may appear later on? 
Otherwise it'll find the first page available, looking from

1 1p 8 2 3 3p 3pm 4 5 6 7 9 0p n l p o 1x 2x 3x 4x 5x 6x 7x 8x

(c.f. man 1 man)

(same remarks for the other links).

Cheers,
Quentin

