Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22352EB64DA
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 06:43:22 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.84])
 by mx.groups.io with SMTP id smtpd.web11.2295.1687761790556186904
 for <docs@lists.yoctoproject.org>;
 Sun, 25 Jun 2023 23:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=CWl5FqCT;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.84, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifxUu/9G19ycAX+mrQZ7L5u4DzXXwcaGghTqCtdDEaydp5WVDNrIhl/a2OlTwz8Q9wMxxENs/omLHpINX67z6J9NBPl5Ys6Hf/QttHM/dquYL3X7RFSeNUhZVdKAfkIMSN5BeMujEFO5yGBjyNu4zqrVsoljxCu6+NVDrxEfhm25qaaTAyshgRtXZ9AyELQyvgWky3j6CfYIqv9vITPwVdKNkZR/cxgash1xdNZCwy/Lj5N88TtF2vJZpqmWdg6kQ6X9QLlGpgUfT6agvg8i3x/HuwA6MxB23pWGWlV6UV6arPpZwNg0tXeuKewyAdtVwkPufyRGNgFcZOrLL/fqRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/ztZMZS0RmbHKyghsCfYdp/kMlQfJkrbbAZ3tsqH98=;
 b=aO3YU7r+0Z3/CBYkj6u401G3JxDazyOndqHxXeOMOAgW/ir2nsVyteJQJA4KX36n4H/iGle+9PKQLRiqxxM/35ROTugPFR08vWnn7Wg9ul5zxaxBiTkmIW2t5CvUg7TYqBOOnWXijvBVOel7cbTP2Ay3GQYWmvhoT8eQS96D5xrdL0pDf4cpcWDq+pouR114g4MKd/j2SkDDQzUlv7ljl6iw5cteRP3wuRqc3ul7oBZsRNf8PkmxwMTx7fkr82/y6vcT1feDBxHAJAWqeuVlP3nDgm7TnZU1JnSRYmsP75j3raxlpHmRNIEV4iyRJ7+/P6ZseRYaJn7kpJXaInkvTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/ztZMZS0RmbHKyghsCfYdp/kMlQfJkrbbAZ3tsqH98=;
 b=CWl5FqCTUqJ0QKi6LE0bZJhnlXnZdwBI07qGx36/VS6RSe3NILo4StAFXefmPJ4S25uF3Tlv3mqfQol9NZ5fxnl07XxA43VWkdEdDEyVodYcxXhoQJdxYzlyogdEQ5gHoupZeU29V3b/cMjJk2MTa+GKUENdNItUdccqny5CTbtdAlrmHFAiJHT9cWLsjSzLWHEAM85PI30a2eL+UA3j1dt0HeV0G0sQYK9+tYaOIdMmyngFxM3qp+wIuXt1cQ6HkVp3Wb9lLRcXMFLv738d6JVqRMdt1tYpZHXYPckzfXMbJT+7Oc1Owcm/vsSL/acXpIVBd9n98uWX6F/j6co0ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by VI1PR04MB9954.eurprd04.prod.outlook.com (2603:10a6:800:1d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 06:43:04 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::f868:358b:fd4d:31bb]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::f868:358b:fd4d:31bb%3]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 06:43:04 +0000
Message-ID: <0db2c074-f292-60bd-8bbe-17a27c65055f@theobroma-systems.com>
Date: Mon, 26 Jun 2023 08:43:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] docs: sdk-manual: appendix-obtain: fix literal block
 content
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
References: <176B16FDD157E15A.20970@lists.yoctoproject.org>
 <20230623175404.1933627-1-michael.opdenacker@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230623175404.1933627-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::20) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|VI1PR04MB9954:EE_
X-MS-Office365-Filtering-Correlation-Id: ce906f84-eeef-44e9-b1b5-08db761097c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JBYXRQ9LOOVayn4bJmrS+QmLwYDL6CCklj2rAMyO4lwKPZi+JWzANsceQKAZgkK8o3V74kVGoP5hTbFgQR4j+Gfhapv1KN2A6nEUpkKRFCklMw4+qixpAqx+SmC21DiaL5ZPQ+TzWoXDSdOZhcoXmAeoOqo0BSSjbWbIx9eOklHW+K4Z+wu2pqATDPSDXoWY9GPxIG2j9JOVMJhtJQ4u4iYRM+Xs0GhJ9XEcgMCO0aucLAha9wHISNPr5YXL/irwlrFiZ1V1C1fOjhK4paAbtSO6K+fkkUVXfBKDKUEZC19VNFgB7xKHPUb+/pY5OfXWV17SYWKgrWd5Z+d7GyUmS8ygMJWwkmkBhdtQVBODcZWzZqVKxJppX2k2VcS+HQy8hnwCi4zrSHDZ1TOkApMZbFZNxCBzXhz4THGHy4X8ykhyH2/DWEaH5HZlFOzP8jCdu0SD0VW4LFdOouWfO/FvvDAc0yRDVyZC+843yaCV7ly+qREuwU67yZcsukx3cJXaV9EK3PR0tyzs/JJlqgbjwKVAOmzVaZhM1Lc1BoKRq9AknDk8BwVopWA55A36ToPR0Lv4jMnV805vwAu552wIsB/Bbj6bqA3ir1H9Dvz1GwsMnlTgZPRVzV3vw/lo3yIB+zGHlKMQNsCUotUFdIHc6w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(39830400003)(346002)(136003)(451199021)(31686004)(36756003)(5660300002)(44832011)(86362001)(8936002)(8676002)(41300700001)(66556008)(66476007)(4326008)(38100700002)(316002)(31696002)(66946007)(6506007)(53546011)(6512007)(4744005)(2906002)(186003)(478600001)(6666004)(83380400001)(2616005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QTVqZmRCWVY0bFNEcEU1VFBtU3lQa0dzdjQ4cmc2RmdCMUdmMFJoSmNOeWRa?=
 =?utf-8?B?ZFZEalpaUnlleW8zeGpTV2hBRzJLdXRjVnRiMktIUWIyVEFHcndsSlRFdkJO?=
 =?utf-8?B?MFNEd1JSWGpWVjgwV29OZklXYVd3VUJHYzhTdEpTYThIY0pmTE9oaWhuVC9X?=
 =?utf-8?B?ZjZmZGRsa2pNYVdUTHFxVkZKMUZ5U2xlL2lXWTBrcWh1NUcvYytsUjFmUEZw?=
 =?utf-8?B?RGVXU0hvdmRFMFNtSUpQbldlaFAwR2Q4OURGeUphWG5RVzhEcUZXNnF2R1Yx?=
 =?utf-8?B?enpxRHk2eDlOWVJKb1RYWm1DTDlGcCtTWlR1WDd0NndpRDJFWWVEZ3JNeE1G?=
 =?utf-8?B?bjNld2djczVtOHQzdExBbFY1MnIxbFVoVFFpeXNQYkhBL2JXM0xKMWJYbm4w?=
 =?utf-8?B?UDhvOE1ycnlLK3lHQnFVa0NkcTVVWWRUQVo1TCsyZmRWSnRwZGZEelJyTDZ3?=
 =?utf-8?B?RlJZSkY2V0xIK0I2MUJHbzR2K2FxSTVIMjA4UVpZdkZFS0tUTGlGY0txZiti?=
 =?utf-8?B?N0Z2emNzNUpnRFV2VlNkc2tMMTh5NWsvOFNvU0pVRUY3VW5GMlVad0VRWlNF?=
 =?utf-8?B?WndIWi9EN0JCVTh4aUw1U0QxOXFKZEZQK05RUStLU2srNXVHUG1yQSs1NGh5?=
 =?utf-8?B?dXo3NmdDRW93Uk8xK0R5Ym5jMGpzSlYxNWw0U05sQkwyVjk0SE8wY1ZFV2ZX?=
 =?utf-8?B?MFEwYTNpREQ1Zm1VM2RLQTY0U1dVOHVuRzh0QWMvSUducWNiNzA4Nk5ma3FN?=
 =?utf-8?B?SDdNc0FCVHJ1MlprbEE5RGphaWlHVTVDeHB2ZVhKZE9SUXpvUjVaZXRlT3BP?=
 =?utf-8?B?NXdrVy84S0R1N3Nnd0dsWXVPQlhzeUM3VG4vQ1FNYm0zVnVQUkc1aDNINVFQ?=
 =?utf-8?B?blprUGc0cEd1UkZyQyswNGZUVzVYRi9GUmdNcTRpT3UxWTNmSjVEMEJPaURW?=
 =?utf-8?B?RmkwUDc2VXVha0JzMlJJS1BFTTdmVysxQktlNnNhTE5MWjVWa0xtVTNLUTVJ?=
 =?utf-8?B?MThBWllGYkJJdU91WkNtWnNEWHFaUGcvdWRtRDdNR3ZLK1V1cEhRV1ZMcFNP?=
 =?utf-8?B?M2g0SHFUWFdJOTVTa1FQMVBtbnRCdHdsK3hJbklFVU1SNzk0M3BkczhxYVp6?=
 =?utf-8?B?SlJtWUwwbGQ1Mzc3SkJEbUhLbnlvUHRPdS84dTROUytNcU5WNWNQdjFFU2ZY?=
 =?utf-8?B?dXUzK3h2M3VJUUhvbXdUQ1dORks3R3dmT1JSVmZ3VDBDTm40RTFWZlRKQWcx?=
 =?utf-8?B?MEVlMHFqbEUrMXVQenplcTNBU3ZOMncrbXlCTStQQUZtK3FsZmdEb1UxTUZa?=
 =?utf-8?B?RmtFaVZuK3N3RDFBMHEvTTFKeUpOK1l6VERnRmJkRmU3eXhRN2s2RkhxSHVD?=
 =?utf-8?B?Mk5QOGVYamQwQ3YxRkdXeVlLWXNHSkN6dGorNFB1TnhLYVptS3pmUmZvaXda?=
 =?utf-8?B?MmhranZuelVlUkxJSmE1bnFlcmlQYXA5eThtNFJWL1M4SklQOGlIbVdGUVNW?=
 =?utf-8?B?Szd1QlczMWZxbW5sS0szYjRzVFVwYm0yMG1ENVBuWmNqMHUzZDNhV0hLbVU0?=
 =?utf-8?B?TW1URWJramZtWnZnallVYkFVTHdIbGhtTGMzSktHTHBKQSt1Ylo4NU16UWFH?=
 =?utf-8?B?cEJ1bUhLTWxkcVp2N3hhd1VmV3hIMzlLdTNxbzlaY0pWL0J2TDBFYzBkK083?=
 =?utf-8?B?WW1JZUhGejRBcHNLWVBqZEV3MzZ6ejVoeFEvYnJVc3JCTllJUWMxOTZvNDQz?=
 =?utf-8?B?ZVIzc2JGZ3I4cHQzNzRaVWZUSkhlQVZaWSt1dzIrVE1HUFNmTEVWN3IxZlFZ?=
 =?utf-8?B?aEdyUERPSzZtOGZ3TXVRY2pYZGc2ZmgzdDNzWUxVdURlSUxxSC9hVkExMU0w?=
 =?utf-8?B?bXRneiswZTJhb1hiWTk1V3ozWngrM2Z1N3ZGNVBIZWRuVnpuSXZJL1NOTFdF?=
 =?utf-8?B?RHE3YmRIbnllaTRIMTdwNjVZY2dNcm5SelJ3WmFqaUU2L0lPVmN2S21zTC8w?=
 =?utf-8?B?UjRycXFibDFUNFl6cUZvUnduRHF5QmdVcGhJejYwMk91dGllVGoyT1JUVXRY?=
 =?utf-8?B?dDZZU1NMeTNtaGI0bUxhSlBFa3N1K1NrQi9UQ09lZ3VtTFdNV0hDTForT2Js?=
 =?utf-8?B?RVFVUkhTTktsbzIwbHBoc2QralZNRXZtNENKYkxIWXdlb1RFTS8yOGx6d0k2?=
 =?utf-8?B?Znp4NHg4d2g3cXVvTGtMWWNIWWhvZHNHSjJ0QXl6UVFGVDdranNIWThYaCta?=
 =?utf-8?B?aXNqcERieUJ3WFRXdWpPWXUwL1JRPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce906f84-eeef-44e9-b1b5-08db761097c0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 06:43:04.2616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJlFZ5DFWW67865pA37uznJdFH8iZDMYWEB2y17iCQ5vRN3whGo1Uh+75lojLYDaDGDhtMvvPW6Oa9Sr6fUqocDVPLdwkSJHFXsTz6tNB/XvWI3mLzZAKCX8eqBJ2GXU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9954
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Jun 2023 06:43:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4040

Hi Michael,

On 6/23/23 19:54, michael.opdenacker@bootlin.com wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> Restore the error message as it is supposed to be issued.
> 
> The literal block renders its content verbatim so a term role (`:term:`)
> would appear as :term: string in there and `---` as --- string instead
> of the expected hyphen.
> 
> Fixes: e319b3bf4eb6 ("manuals: add missing references to SDKMACHINE and SDK_ARCH")
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 

It'll teach me to send a patch in a hurry before taking a day off :)

Thanks, lgtm.

Cheers,
Quentin

