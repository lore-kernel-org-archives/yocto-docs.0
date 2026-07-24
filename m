Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE5EC531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 16:28:00 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23091.1784910479712349616
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 09:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=L798SNaI;
 spf=pass (domain: cherry.de, ip: 52.101.66.32, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MN3JRXV7opsnMkmyY+00rsoMIlgvMCZ40R5TFA8mgcGEVaI0eOOYOQGIAMYMGvENagtmOePs9CzCoDCBs/zl0h0IfZHbBgfnXLyVVTOScmB62dP8bVT9EnciCECD66p3io1+lQfPJEbf/o5aU5RuKYVh00lhKlwh/SljZn+dYegnL2obPHo+F/km3Jl/qfWeoGwSdUcoBJQFLkF4+5JY8rmgrQaFagHXQrnDQQtTds812mAetWekNBser41evbR/4ka4GFCZWMXSMUquDvFhyBZkQT2nfFBVC5n5G6AkKpIQx1RlAW1Yh0nP+tSfgLShnJzSCKgff+0/UHFXl3eNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39YZ63YQACN3Jua5aqSvZ+HhhxKnNHKWco0J8W0BSaI=;
 b=qSey2gpwc1tySo9qXeclviGacyiNBXw3j/UHFCdjHkaOEYevtxZGOGZGzY4QwKZ8vQa9+NdPnm9FVaniSFLEM+47jILpJI+uhpnzY5m6P8x+ac+jBIfIo0EB7UwRCRqT5vTaBg2dmPXiC0Xt/4W/9XUdRG2VB+wq6bdAgzyUFYrsMHST8mOUjmiPJdKK1htZqZ/uXyqtkXQe0i6iR8G4imrfOaGMUVu/LXZKgc757/KpF7eIVifXkuPaYmUSNbuTo1UMdbggnmEVJFqb8gzK0Nx9Mk9aklKf8F5CWkfZh3epWluxFt16cmlZ+viJ37i32ShH9A+DGJh3SK+PEFswtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39YZ63YQACN3Jua5aqSvZ+HhhxKnNHKWco0J8W0BSaI=;
 b=L798SNaIyHr3AD5RpeiUYg7io+lzR9a406dwchEFZLJ3gyBT8ia1ENaB9y5+43mcqv8+eXQNWiyomZ+XlHXQJSPvoo78xmI90++4UJeM2JQCDKtUME+yIqOWcH9t8hy8LriXBbQv5AVOoID60gZFjBD9rdIrzMt2nk0cMUiE/tg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI0PR04MB10164.eurprd04.prod.outlook.com (2603:10a6:800:243::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 16:27:54 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.017; Fri, 24 Jul 2026
 16:27:53 +0000
Message-ID: <fecc23f0-65d3-4621-8969-1ea92f24e9f2@cherry.de>
Date: Fri, 24 Jul 2026 18:27:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 3/4] tools: add gen-doc-links to generate
 documentation link flags
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260716-gen-doc-links-intersphinx-v2-0-83cb3aef6ff6@bootlin.com>
 <20260716-gen-doc-links-intersphinx-v2-3-83cb3aef6ff6@bootlin.com>
 <9b51a647-76c1-4bbf-b4fe-c9fc57109bc7@cherry.de>
 <DK6UEDV65R3Y.2HPH1DCKA1Z2V@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DK6UEDV65R3Y.2HPH1DCKA1Z2V@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0045.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::18) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI0PR04MB10164:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d0f0e0-f6ad-437b-c924-08dee9a0829f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	dacuPJsbvPI0vfyXxLbmHavjEQQucqw/zixegoVOm2hAzhY5e4f6LeJXhbjsRuqhhduy77hWUP1stzHX+i3ek7E4P2r3CSDjAUq11zKFB3OcLYEr6s9bWPPfwdbC//vBnlCzSm8hG72JYC9aCq9VyqfD3vy2OuIotS3Sb1ZuT9lyotSsCoUW8kdnnD+ZwswjQjExHYb11Icr7hur2BO+NLpLEGbz1Tpn2+YWyWkLhEreuzc2Tqy0Tqqst3L1tQBkeHrUWrroIfG5TlqeXSHk0mSrsHMYvfxomPduvRJOZoCSy/8pH2twe5L6wJSBTGlRr4NHQQG26uXS/8/O+ZLuXffGQqxMrnv3C6lx1O2t7DPzdinxTp/QEJq0eJ6dD61zbudEZqI4dK9pWpQ26PboRWiIDtwQ9sM9GzmHeplkIzwzkEPSLiIUlPvybLALUvewa7OQAQlTjqFzgDHCuECTnA9yDjQNR9riJD5aRMuRp4cAm7qQCKOK/rFUQUnjyMyhTqChySuYRtyihWYSsGl/RygCtUUzdWC4HLrFwaRaCBF64ClHxWEqaVYh3C2VpjHLGtT8acMmfGy9dALLxqnfFBs1RZqsY3UXAFsJ/eMlc/8WTASnVCyKu8Mp9qSKK0CsUZeKnXhIO8Azz41cRmbRG4EZu2n0txS2PJhygXAowr4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QVk2ZncwTkkzSWQ2SzYxYUh1alV2OWRSUnlmYkN6dEpUY2dCMmpwMGFsaXNh?=
 =?utf-8?B?dEY0MVlVcTNhcXZYV21TOENxNEl4R0U0bGMzYk5ycFRERHM5MkxMZkhnYkxF?=
 =?utf-8?B?bkltVnhJUFpZYlBNZjVpemRZbmRJUGhrRUc5ZU82ZlRJc3Fnei9hb2RxOEJT?=
 =?utf-8?B?L0pSOTlnVUcxdzdOUkdvZVZaTWgwNm5uaURrSEFBMEFuaUdONnFYaFpMQUlB?=
 =?utf-8?B?UHoxV2tHOTRoWDNFMEpac3AxNVdNMzVyUzV4RnFxWG9LTWFTUDBKMVE1R3NU?=
 =?utf-8?B?WGc2Y0lPcEE0bVlWWExzZ25jVkQrZUNYSDRFaWNjcUQ1VUFNZEFyQzUvOU1r?=
 =?utf-8?B?MlJxNkIvcWhMN01jaUd2Zys2OHVlR3BROVdiSzA5aGhpWlVkWDdoQWRjUDI5?=
 =?utf-8?B?OThFeDFTM2N2MGNVbEVUTlJaemFNOGh3cUlkbmgvQWZBRUdIeDZUYTJOenlk?=
 =?utf-8?B?NHpHOSsrQTVYWjlEM1MxTm12NTlZL0xnS0R0N205Z0ZJcUg1OXRnNzA3dWJk?=
 =?utf-8?B?ZHJkYkl5UWc5T2JLMlBuY012dUZWbENXQWVYbk1udDhIQTlGZXlmdU1MNVox?=
 =?utf-8?B?OGttRFU1bFl2L3NaR2ZoSXhkdXltaE03UklKVXA5VmlTeUhuWEY4YlF2aWRR?=
 =?utf-8?B?YmlycWVwUTNBdVcwemQyQVVyajY4ekFvV3ZhZlcrS1BCL1dwN0dVKzR1Vnkv?=
 =?utf-8?B?OHZuRzVzNTR3SXhPNkpROWpqaVhqS3ZaZjNIVDlSTGJoV2pTbzhOMkgyTlFB?=
 =?utf-8?B?N1lkY3F2Y25lSkVpdTFRamtlV2RrVTVETHBxOVBmUzFyZWRiS2wvWHBvR3Jk?=
 =?utf-8?B?OWROSmN0NWpoN085ZDNwY0hpRHAyT1NPK0U4YUE2SmtuYlJSa0lEU2M1VGxp?=
 =?utf-8?B?MVdhR0thWjZndmpzU1hjcGpFell2SER1amZOakdrME5tWWZJRW9NV1h3S3Rt?=
 =?utf-8?B?RHRMWkxvL3h2cFBHSHN2TkFGd05TaTdMZC9wb2tnQzNPang0TGI1b01VNXFL?=
 =?utf-8?B?bFNsNVd6VWRVcVFlM3M3NDdaMEJ6eGNJV0tPRWdNUWV6VUhlVy95SG9YM1Jx?=
 =?utf-8?B?RmhlSUtKMHZDa1NUTDNad0d1UytVZTV0ZDB0N3FnM1B6R2RCWUF5NjlwRnNl?=
 =?utf-8?B?YVQ1azR2cS9qeFVXbmhYTEFPZ3BJc0xMRWJXZzBwS0pGbXlSM3FxODJBT1ZH?=
 =?utf-8?B?RVhORDhhYjd2eWhicE1VcG9SYXlLYVNXV2NBWC9EQkhBMlJKY0had0dOaW5X?=
 =?utf-8?B?aFBtWExEQ1lueWZaWWU2TFVHUElnY1h1TmVtNmQ0aE9IMHV1dk84S3I5cEd4?=
 =?utf-8?B?cXZNU2ZHOEZnMzVIV1k5RDEzSEdPQU5ZSGJSdnhUd0k2cFdKMlBCYzdhbXBV?=
 =?utf-8?B?SldqSlExU0kvSVRwQzFPSHZmdTQ4R0hNcmF3QUExVWx6SWhXTThDeXBuZmNS?=
 =?utf-8?B?eUREQytramFJci9hWm9WZ2NrQ00rY2s3bGRaa3YyV2V0NFhiQmpMZFFiYk1U?=
 =?utf-8?B?akpVbGpEcHh4VlZoLzF4RDdwdmpPODRZSTlTVXpLWEtxejZoTFd0WEtYdXAv?=
 =?utf-8?B?T3NkQlh5N2N4V2I0UUx1ZzVFYXVNY1k4MEZHQ1ZVd2dmeFVCSHpFV01Od2dS?=
 =?utf-8?B?WmQ3ZzQ2bnc3MWhSMWgrQ21TQ21SYS9GWDU2RVg0YTFncDJFNHJySmNOeVJF?=
 =?utf-8?B?MlBCS0JDNElOZzhaNTAzbHNFTHdzOUhtS2l6WU5sMUdQZG90VXN4RkpDNklL?=
 =?utf-8?B?REZ4Vm95VldRRzhQMWJlbzNHWks3c3ZLT0ExblZiTlZpUitxRHlyK2RSWkpC?=
 =?utf-8?B?Y291UGZQRzM5eEFINzVpNG9PbTdrMHpQNUhJendtWXA1emFrLzh2aldFUE4r?=
 =?utf-8?B?SHZnZzg4Z1YwZWE2eHdLamNoZkZLQnFNRld2UDBsSWVudEE0UzcxU2ZsMktJ?=
 =?utf-8?B?aWZIWktQcXJucEFvNmZZV1ZaUjZBK2hYQ095Uys3dlE5clpKbkZvRzY5ZC9L?=
 =?utf-8?B?MTlNcDNLM3dqK2k5THFydGhZRmFVeWZlQzhqM2JIMCtYdzhYa2ZDc2RoUGFz?=
 =?utf-8?B?dmZZYlppWlY5WnY1ek4wdjBseFFGdFJVRDJkOG1iakp1L21EOE5PQVlYWDNF?=
 =?utf-8?B?U01lUFQyMzV3MlI3bGEybzJOVGxnWHQ0QWRGeGdCbWIyWU1Edmwwd2pheU1u?=
 =?utf-8?B?NU13NUdUR2toQThaU2pVOENEN1ZDKzZuYWJadlJFa1hWaUgyTmRhWWhPZVN3?=
 =?utf-8?B?eGZwa1ZydTUxTnk2YWIrVzNkLzU2QlBNa0ViM3BEYzVtU1ZLL1drSitWV29z?=
 =?utf-8?B?TUtNRmx1aUNFSndHVHlhQS8rSVdUK0I5K3FvUFJvb2VLaS9mV29Mdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d0f0e0-f6ad-437b-c924-08dee9a0829f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 16:27:53.0086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvfjaGfNqw+mQ7p2JaXIgIyXYvapin5/meDTFVyIbnu8GCpTpGYPk6D9sYb7i5cnJVBUeafFJhCaOsCYdtzsuotrIjlhhT9ODLhik+K96JY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10164
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 16:28:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10141

Hi Antonin,

On 7/24/26 3:40 PM, Antonin Godard wrote:
> Hi,
> 
> On Mon Jul 20, 2026 at 6:39 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> On 7/16/26 2:18 PM, Antonin Godard via lists.yoctoproject.org wrote:
[...]
>>> +def main():
>>> +    args = parse_arguments()
>>> +
>>> +    yocto_docs_dict = {}
>>> +
>>> +    if not args.yocto_docs_inv.exists():
>>> +        print(f"yocto-docs inventory not found at {args.yocto_docs_inv}, "
>>> +              "use the --yocto-docs-inv option or set YOCTO_DOCS_INV_PATH "
>>> +              "in your environment")
>>> +        sys.exit(0)
>>> +
>>> +    if not args.bitbake_inv.exists():
>>> +        print(f"bitbake inventory not found at {args.yocto_docs_inv}, "
>>> +              "use the --bitbake-inv option or set BITBAKE_INV_PATH "
>>> +              "in your environment")
>>> +        sys.exit(0)
>>
>> Don't you want to sys.exit(1) here (and above) instead to show the user
>> this is an error?
> 
> I did not want to block creating a commit because the docs wasn't built.
> I looked a bit at it and pre-commit does not have a special error code that
> could signify a SKIP.
> 

Mmmmm... Any chance this can be configurable? I'm thinking people may 
want to run this script outside of pre-commit. Maybe via a parameter you 
pass to pre-commit for example, or via an environment variable that is 
set in pre-commit?

In any case, this seems wrong when reading the code and I wouldn't be 
surprised if I ever look into this script in a few years time that I 
won't "fix" this... so add at least add a nice comment just above the 
sys.exit(0) in error paths explaining this is intended and the reason.

[...]

Cheers,
Quentin

