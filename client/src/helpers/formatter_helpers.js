import React from 'react';
import StringHelpers from './string_helpers';

const FormattersHelpers = {};

FormattersHelpers.formatErrors = (errors) => {
  const keys = Object.keys(errors);

  return keys.map((key, i) => {
    return (
      <li key={i}>
        { `${key === 'error' ? '' : StringHelpers.capitalizeStr(key)} ${errors[key]}` }
      </li>
    )
  })
}

export default FormattersHelpers
