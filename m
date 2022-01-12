Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940F7C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 15:20:40 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.66])
 by mx.groups.io with SMTP id smtpd.web08.24417.1642000837316837628
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 07:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=XewipP/0;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.66,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrZ6MFIJ56DvgQn8UaRLsPy7vg/ZhfDrlQ2jWIj5jNMkc1fQj8RPHtWBCaCkcFSk6IHK1B7j1CWSEuH1NNwyTld6p6TykuPd6D2VeIswyE+tT/hfWVavZcgH3Zuz4kSkk2NQIn3wSQu3ETadmi0zVmuTg171zjD0zq/wbVA+9wgS7A2sGMt2LCUIDl6zi+/EuOobT0RXErt37hOWsGyPZArDgClKLmAPDrzYnkWP4NrAAixa3ZRKu84Dndg+ZjT0KefctxDJcgv7aZ52wGgnIOncqh4adagqVmhBqY5H1Y8scYI2PSEL0WrQ5ZdzzJ/BnOooc84MDKFjcH9II/4qyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onGG15WLJbuIiuiwn9ndRA0X1W8lMUVEti33AnRbgdU=;
 b=oFSsC9aNUOXKPpTH/i/SJUaUcl3nFttS0gswy+egdbJS4uGxm/PDv0Nfu9gDiX98Wd9jwhwA2BB9IXfFyKWRzbtiV9rwannizOGyCN2PYefp6Si/S5iwAfU42MTRiMvLUSRGMUxshJC7+yssJ1EnFZaEilD5wu+3P/NkL3paERnNxZ0R3ABXMw/PC73Iz3Ou1zf+LSKyUNWMNEJshD/oduVMsqFnzlLMzCAdn/J5StsaJ1mqZQdZh7GfvNWgbwGImVCm8L+m7ygHxw1sAqyno/K/oiCAKxapPwbcdjIbyDIFcOksyrIfmvUMPoS/pgw8l9x2mG38F8qO5p085HtItQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onGG15WLJbuIiuiwn9ndRA0X1W8lMUVEti33AnRbgdU=;
 b=XewipP/0xdsNTBsJHQDqHkflBwWki0ITKal3OwtbBUdAg4p3ZqESTTR+888vynVpQJaNhkNBViEORX/tCb6uia+IvSF76ONj5ObNyMnov8m+3BWZMwWSMPzqCnUjrP2HaRyU/yvzz/+GuUJbDSz9QPW4WUwnqU65Cv5jezwvoFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM4PR0401MB2418.eurprd04.prod.outlook.com (2603:10a6:200:4d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 15:20:34 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%7]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 15:20:34 +0000
Message-ID: <f89004ff-145a-131d-6995-f9d13fa14a90@theobroma-systems.com>
Date: Wed, 12 Jan 2022 16:20:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [docs] [RFC] doc: add release notes for 3.4
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org
References: <20220105203318.1859315-1-michael.opdenacker@bootlin.com>
 <3d5f5652-8d92-f455-7541-da63e12fbafd@theobroma-systems.com>
 <2478bdd7-fe84-66e6-e0bd-e253d9730aaf@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <2478bdd7-fe84-66e6-e0bd-e253d9730aaf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR09CA0169.eurprd09.prod.outlook.com
 (2603:10a6:800:120::23) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c26a7ba4-2488-4670-111c-08d9d5df1409
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2418:EE_
X-Microsoft-Antispam-PRVS: 
	<AM4PR0401MB241812D9ECBF519B631B60DCC2529@AM4PR0401MB2418.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y8Ty7xmPO3thVbyM4JmZC3cDaQaptKFjOWRTqe3NJknF7Lv0fLS6xw4XbQdlcyb+xCeWTUFXVo+NfeD0ElO2Lh2pTWYGUl4/QXnEjfpQwFGPBY/zoXvow0tP9PFFOkZ9meY2XFUzrHJ60VCXGWgqhlIzWeyGHQBpyxzKQ0U+54fQG4wXE3qU9ZVMcU9IavqvDVnSIeC27AbWwoqaeFm1taRXD4hvl82Ao6g0wbtymKXgrUFhOWE6PwGicVzQz1+DKEZt7wT9gCbTvJ2VeAKc6UDW/1BUafJUwzhnniXsPVOlVawr3BFLG7zlKydszQKoUKKl0ig19XYy3m6zVk/Atq7ICw2njOA5M6+abMk2KQJ9Tpj/2y0AwfL/7sCYThOkF31VxsBhUYNuVe0/f1X1/Fk5GcnQS9xqVMGDLKVpSvl1EPcHOsQ0BCi0X/apWI3UxJ9NwO4gIrEuIVVafoo1kO4zeNYe0YUhXlOdtz6zzllWdWJqA/zZ+LawWF1yDulALh/b5gyNLltfXmYe5iiKVIIga0waKuL1+kt+PkUy7JxGKymxde03ubs2jLBt26EtIeUvO8hq8fGGk6AknxA7xBRkUMWfOKu6m7YDyjxSG0rDvJdEqBjOn/db1Daq1KOmr6lk9jSiPpGFzOOj/DJm1PdTvEHXhBnQ79P6zpikB4wC1qAYE41KfdGM6D3uOQiuOybNHUAMV9ZXDv7/frOX4hOPnYBB4WZtgn626A5rrDw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(8676002)(8936002)(2616005)(44832011)(6512007)(66476007)(186003)(31696002)(86362001)(31686004)(53546011)(508600001)(6506007)(5660300002)(66946007)(2906002)(6486002)(66556008)(316002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yOqb74Gfv6pqymBenhlQVavcviCW5EUtOWcQgFRNsqECerwXUW2h1BTMZZKY?=
 =?us-ascii?Q?HzHeaOqDjMSH855Ofjlme1Eh1yjZiY6PiCzRSdcaYYeoSFMz6WpK9+T8jbAg?=
 =?us-ascii?Q?DwF9+ZQNlx+3vIK0lfMvuwwrI9pBf70PQs+hl7z7rgSfnIQXlkQNv9SB0X4d?=
 =?us-ascii?Q?wXN0dNJ7npne7iN5InyM3yEgOzmv2kj33dR5E8jS/irlTt5O9xD2F0Bd6uM3?=
 =?us-ascii?Q?RXyQpS8qox+lUBkXX/C9Plq6xKZpEEOhxeyrjKTd92DPH8KDmzTQg73zqJ+J?=
 =?us-ascii?Q?QOZOuENmf3Y03+gJK/lMT+jqJdpkVfcQCiD99jNu39SD5lSOPg9bxNG/Spsz?=
 =?us-ascii?Q?pF9H/B3Z4lkfcyp+YAoLIJdxe1xguEL9fFcT5Sps1s9RF86uT5jKWy2Wo9FN?=
 =?us-ascii?Q?MzR2hT5xhrr2DWDbGerlJ+dcfl68IJkO9ix+wvejPD9korSU+JkuNnOzLWNP?=
 =?us-ascii?Q?sxwTxaZyloZlAYMZU5eOLS636MIRKtzJ0cg2AdGdu4xCHQbizvFXaTw2MBpS?=
 =?us-ascii?Q?MxnE7Mv/v4V4HiJEl+xh+WU7cQ/iyOMscSDMLSQANHHdHp7nHBZANjjDjinJ?=
 =?us-ascii?Q?YDTL0AzyV7kGvkBbgp1aboaFQ5oJOQ/TBqempEZ0qZaIe0LMBVwAvR3PTC5g?=
 =?us-ascii?Q?aDB1EfKn0GCWq4335M72jf2gMRTnRCtWZ+mdLM3L6Pp9NI5iY+hE60IlXoub?=
 =?us-ascii?Q?SlDosEHnHW9n72Eo7FJASL6JBF9ozdmUlmSx0ewsO/S6pOiew7oyp1YkEUaK?=
 =?us-ascii?Q?igyJNErnF2QrdNaGuKYgBjaDgJmD5/tmfAVlyzjW0m55LqJKFpt/HEWGNAN6?=
 =?us-ascii?Q?k06svSpoZtyx/jQWjBkVwZvxDOP0UwVRWcUIz0+L1ARh/uYSdQYs+WtrqWt8?=
 =?us-ascii?Q?zP8MFV1P1RHPGJCoyzh4aNLpzgoI3hfwGatJHKkl2Blc6dYtyK/lEoz8YXWH?=
 =?us-ascii?Q?/f2B0oznHl87TLKXdlhqFZfbnFKURvIZsPNgTHI4xBLyaEIhweJkoYAX3Bi/?=
 =?us-ascii?Q?JwZkS3IgCibMdXn62y9HXQ1gDZrq+DJ17MRRAR6BtVeM8nsPLs8H7n7vYAyM?=
 =?us-ascii?Q?DuvVvew5j105nxXfGPcnUf/YZhVkr9knxYs73YI7mD2IurfPrVyNR6OmuvMm?=
 =?us-ascii?Q?fe2LvYDInQYqSpUkvnUFhMAP4juG8hsKg82dd/4G+kgFKl7weO/Jzf65B3HV?=
 =?us-ascii?Q?r2G4ot94CB3qAyGEQyZdPce14viAGvzulwABuuj5meLpni4fijM4ipe/gB9n?=
 =?us-ascii?Q?JbVBWod+O51Po7MeGs72yRU0S17VkG/3CJ0aXNkvpAEeicLzLd5Od8onLihi?=
 =?us-ascii?Q?Hn+3GBG66SgGpY+ibRFY3JdJvMZSRPOzlM0dU6bfSC2hmu2Aa5xfS9w7V7zF?=
 =?us-ascii?Q?eu+wYbh1EuYmSGi8DsEzTor6VHbx35LsBCZrDp21Qo+2KqSUjAg16vV7c9ei?=
 =?us-ascii?Q?sDBWXWh8yhtYShT/p1pnxs9Mb1FSH+kY8kQP2C31DZzfD3zdR1nYhuQsLORH?=
 =?us-ascii?Q?zPYgZuYHIBdIW+OY3MMIyEHpr7RI8k+8XLTQDPHbBUYRb60f+HrQ3UMD4SFk?=
 =?us-ascii?Q?QLcPbp5vQfGtPJJLsmThqOqi1wr2kxklgAF/Ma0tvMloo8eH8RDCGD3PHkA8?=
 =?us-ascii?Q?SbOo8VOosUpZTgu8wKZN41rlWowJVpip9c16kigeqZQbwoZPFo7iF64Samss?=
 =?us-ascii?Q?GZA9ygeptF8gSVzIzjTglb2W1PZgD7cyAdDibpDFHd29raplLLtpZUFquZYV?=
 =?us-ascii?Q?7ikEqHKxB7MZMJTolI8IzhPLBhNAy7I=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c26a7ba4-2488-4670-111c-08d9d5df1409
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 15:20:34.1759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7joH0NDYQ3PTP3iV+Sr6ogA4lke5sIV3PFu58c+MxdZT6Dq42jdIhNv1cELnTxRWRuXwBOpKp67YF4HhH10tB/0j7fVu0/bVBag8BsLf7ncSa6K40xKsqOlBXvPONrFn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2418
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Jan 2022 15:20:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2397

Hi Michael,

On 1/12/22 16:07, Michael Opdenacker wrote:
> Hi Quentin
>=20
> Thanks for the review!
>=20
> On 1/12/22 3:18 PM, Quentin Schulz wrote:
>> Hi Michael,
>>
>> On 1/5/22 21:33, Michael Opdenacker wrote:
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> ---
>>>  =C2=A0> The idea is to add the release notes to the documentation
>>> repository. Let's start with 3.4, to collect feedback,
>>> before migrating earlier releases.
>>>
>>> The release notes have been adapted to make them
>>> more reader friends. That's why they no longer start
>>> with raw tree and branch information.
>>>
>>
>> The html file you sent is not enough since we're missing css and js
>> files, etc.. So we can't really use it as is.
>>
>> I'm wondering if we shouldn't merge the release notes with the
>> migration manual and have something like "releases" section with a
>> page per release and a section for the release notes and one for the
>> migration manual?
>=20
>=20
> Hey, this sounds like a good idea to improve clarity and reduce
> complexity. Are you suggesting, for each release, to have one page for
> both documents with two sections, or a single page for each release (for
> a simpler menu), with links to two separate documents?
>=20

"for each release, to have one page for both documents with two=20
sections" was what I had in mind.
Or to put it in other words, not "for both documents with two sections"=20
but "with the content of both documents in two sections", though, well=20
they won't be documents once their content is in one single page but eh.

Let me know if I should rephrase to convey my ideas better,
Cheers,
Quentin

